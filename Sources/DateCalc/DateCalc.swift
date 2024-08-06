// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// Супер-Функция для расчета количества дней между двумя датами
public func daysBetweenDates(country: String, region: String, subregion: String,
                      calendarType: String,
                      startDate: Date, endDate: Date,
                      includeFirstDay: Bool) -> (Int, [Date], [Date], [Date], Bool, Date?) {
    let calendar = Calendar.current
    let dateManager = DateManager.shared
    let holidayData = HolidayData.shared
    var allDays = [Date]()
    var workingDays = [Date]()
    var realWorkingDays = [Date]()
    
    // для реальных рабочих дней
    func isWorking(_ date: Date) -> Bool {
        if dateManager.isWorking(date) && !holidayStrings.contains(date.shortServerFormat) {
            return true
        }
        if !dateManager.isWorking(date) && workingStrings.contains(date.shortServerFormat) {
            return true
        }
        return false
    }

    // Список всех настоящих дней между датами
    var holidayStrings: [String] {
        holidayData.specialDays.filter{ !$0.isWorking }.map { $0.stringDate }
    }
    var workingStrings: [String] {
        holidayData.specialDays.filter{ $0.isWorking }.map { $0.stringDate }
    }

    
    // Разница между датами в днях
    // Не имеет смысла, если мы считаем все дни, на их основе можно получить это число
    let daysDifference = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
    
    // Заполнение массива всех дней между начальной и конечной датами
//    for i in 0...daysDifference {
//        if let date = calendar.date(byAdding: .day, value: i, to: startDate) {
//            allDays.append(date)
//        }
//    }
    
    // Фильтрация рабочих дней из всех дней
//    for day in allDays {
//        if !calendar.isDateInWeekend(day) {
//            workingDays.append(day)
//        }
//    }


    // Заполнение массива всех дней между начальной и конечной датами
    var current = startDate
    while current < endDate {
        allDays.append(current)
        current = current.nextDay
    }

    // Заполнение массива рабочих дней между начальной и конечной датами
    current = startDate
    while current < endDate {
        if current.isWorking {
            workingDays.append(current)
        }
        current = current.nextDay
    }

    // Заполнение массива реальных рабочих дней между начальной и конечной датами
    current = startDate
    while current < endDate {
        if current.isWorking {
            realWorkingDays.append(current)
        }
        current = current.nextDay
    }
    
    return (daysDifference, allDays, workingDays, realWorkingDays, false, nil)
}

/// Супер-Функция для определения даты через определенное количество дней
public func dateAfterDays(country: String, region: String, subregion: String,
                   calendarType: String,
                   initialDate: Date,
                   days: Int,
                   workingDaysOnly: Bool,
                   directionFuture: Bool) -> (Date, String) {
    
    let dateManager = DateManager.shared
    let holidayData = HolidayData.shared

    // для реальных рабочих дней
    func isWorking(_ date: Date) -> Bool {
        if dateManager.isWorking(date) && !holidayStrings.contains(date.shortServerFormat) {
            return true
        }
        if !dateManager.isWorking(date) && workingStrings.contains(date.shortServerFormat) {
            return true
        }
        return false
    }

    func nextWorkingAfter(_ date: Date) -> Date {
        var current = date
        while !isWorking(current) {
            current = current.nextDay
        }
        return current
    }

    
    
    // Список всех настоящих дней между датами
    var holidayStrings: [String] {
        holidayData.specialDays.filter{ !$0.isWorking }.map { $0.stringDate }
    }
    var workingStrings: [String] {
        holidayData.specialDays.filter{ $0.isWorking }.map { $0.stringDate }
    }

    
    var dayType = ""
    var resultDate = initialDate
    var initDays = days
    while initDays > 0 {
        if directionFuture {
            resultDate = resultDate.nextDay
        } else {
            resultDate = resultDate.dayBefore
        }
        if workingDaysOnly {
            if isWorking(resultDate) {
                initDays -= 1
            }
        } else {
            initDays -= 1
        }
    }

    if isWorking(resultDate) {
        dayType = "Это рабочий день"
    } else {
        let nextWorking = nextWorkingAfter(resultDate)
        dayType = "Это нерабочий день, следующий рабочий день: \(nextWorking.shortFormat)"
    }

    
    
    
    return (resultDate, dayType)
}

/// Количество дней между датами
public func daysBetween(startDate: Date, endDate: Date) -> Int {
    let calendar = Calendar.current
    let start = calendar.startOfDay(for: startDate)
    let end = calendar.startOfDay(for: endDate)
    let components = calendar.dateComponents([.day], from: start, to: end)
    return components.day ?? 0
}

/// String date from Unix date
public func dateTimeString(from unixTime: Int) -> String {
    let date = Date(timeIntervalSince1970: Double(unixTime))
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter.string(from: date)
}

public func dateString(from unixTime: Int) -> String {
    let date = Date(timeIntervalSince1970: Double(unixTime))
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter.string(from: date)
}

public func dateStringOptional(from unixTime: Int?) -> String {
    guard let unixTime else { return "- - - -" }
    if unixTime <= 0{
        return "- <<< - -"
    }

    let date = Date(timeIntervalSince1970: Double(unixTime))
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter.string(from: date)
}

public func timeString(from unixTime: Int) -> String {
    let date = Date(timeIntervalSince1970: Double(unixTime))
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    return formatter.string(from: date)
}

public func dateFromServerDate(stringDate: String?) -> String {
    guard let stringDate else { return "" }
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = formatter.date(from: stringDate)
    return dateOnlyString(from: date) + " " + timeOnlyString(from: date)
}

/// Возвращает дату или заглушку "-.-.-"
public func dateOrStubFrom(serverDate: String?, stub: String) -> String {
    guard let serverDate else { return stub }
    let date = safeDateFrom(stringDate: serverDate)
    return dateOnlyString(from: date)
}

public func dateOnlyFromServerDate(stringDate: String?) -> String {
    guard let stringDate else { return "" }
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = formatter.date(from: stringDate)
    return dateOnlyString(from: date)
}

public func timeOnlyFromServerDate(stringDate: String?) -> String {
    guard let stringDate else { return "" }
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = formatter.date(from: stringDate)
    return timeOnlyString(from: date)
}

/// Пытается получить дату из любой строки
public func safeDateFrom(stringDate: String?) -> Date {
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    guard let stringDate else { return Date() }
    if let longDate = formatter.date(from: stringDate) {
        return longDate
    } else {
        formatter.dateFormat = "yyyy-MM-dd"
        if let shortDate = formatter.date(from: stringDate) {
            return shortDate
        } else {
            return Date()
        }
    }
}

public func dateFromParserString(stringDate: String?) -> Date? {
    guard let date = stringDate else { return nil }
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "dd.MM.yyyy"
    return formatter.date(from: date)
}

public func dateTimeFromParserString(stringDate: String?) -> Date? {
    guard let date = stringDate else { return nil }
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "dd.MM.yyyy HH:mm"
    return formatter.date(from: date)
}


public func dateFromServerString(stringDate: String?) -> Date? {
    guard let date = stringDate else { return nil }
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter.date(from: date)
}

/// Сколько дней между датой в сервер формате ("yyyy-MM-dd HH:mm:ss")  и сегодня
public func daysToday(from serverDate: String?) -> Int {
    guard let date = dateFromServerString(stringDate: serverDate) else { return 0 }
    let calendar = Calendar.current
    
    let components = calendar.dateComponents( [.day], from: date.zeroHours, to: Date().zeroHours )
    return components.day ?? 0
}


/// Склоняет дни: день, дня, дней
public func corrected(days: Int) -> LocalizedStringKey {
    let lastDigit = (days - (days / 10) * 10).absolute
    let lastTwoDigits = (days - (days / 100) * 100).absolute
    let oneDay = LocalizedStringKey("1day")
    let twoDays = LocalizedStringKey("2days")
    let fiveDays = LocalizedStringKey("days")
    var correct = LocalizedStringKey("")
    if Locale.current.identifier == "ru_RU" {
        switch lastDigit {
        case 1:
            correct = (lastTwoDigits < 10 || lastTwoDigits > 20) ? oneDay : fiveDays
        case 2, 3, 4:
            correct = (lastTwoDigits < 10 || lastTwoDigits > 20) ? twoDays : fiveDays
        default:
            correct = fiveDays
        }
    } else {
        correct = days.absolute > 1 ? fiveDays : oneDay
    }
    if days == 0 {
        correct = LocalizedStringKey("")
    }
    return correct
}

public func correctedRU(days: Int) -> String {
    let lastDigit = (days - (days / 10) * 10).absolute
    let lastTwoDigits = (days - (days / 100) * 100).absolute
    let oneDay = "день"
    let twoDays = "дня"
    let fiveDays = "дней"
    var correct = ""
    switch lastDigit {
    case 1:
        correct = (lastTwoDigits < 10 || lastTwoDigits > 20) ? oneDay : fiveDays
    case 2, 3, 4:
        correct = (lastTwoDigits < 10 || lastTwoDigits > 20) ? twoDays : fiveDays
    default:
        correct = fiveDays
    }
    
    if days == 0 {
        correct = ""
    }
    return correct
}

/// Склоняет годы: год, года, лет
public func corrected(years: Int) -> LocalizedStringKey {
    let lastDigit = (years - (years / 10) * 10).absolute
    let lastTwoDigits = (years - (years / 100) * 100).absolute
    let oneDay = LocalizedStringKey("y1")
    let twoDays = LocalizedStringKey("y2")
    let fiveDays = LocalizedStringKey("ys")
    var correct = LocalizedStringKey("")
    if Locale.current.identifier == "ru_RU" {
        switch lastDigit {
        case 1:
            correct = (lastTwoDigits < 10 || lastTwoDigits > 20) ? oneDay : fiveDays
        case 2, 3, 4:
            correct = (lastTwoDigits < 10 || lastTwoDigits > 20) ? twoDays : fiveDays
        default:
            correct = fiveDays
        }
    } else {
        correct = years.absolute > 1 ? fiveDays : oneDay
    }
    if years == 0 {
        correct = LocalizedStringKey("")
    }
    return correct
}

/// Склоняет месяцы: месяц, месяца, месяцев
public func corrected(months: Int) -> LocalizedStringKey {
    let lastDigit = (months - (months / 10) * 10).absolute
    let lastTwoDigits = (months - (months / 100) * 100).absolute
    let oneDay = LocalizedStringKey("m1")
    let twoDays = LocalizedStringKey("m2")
    let fiveDays = LocalizedStringKey("ms")
    var correct = LocalizedStringKey("")
    if Locale.current.identifier == "ru_RU" {
        switch lastDigit {
        case 1:
            correct = (lastTwoDigits < 10 || lastTwoDigits > 20) ? oneDay : fiveDays
        case 2, 3, 4:
            correct = (lastTwoDigits < 10 || lastTwoDigits > 20) ? twoDays : fiveDays
        default:
            correct = fiveDays
        }
    } else {
        correct = months.absolute > 1 ? fiveDays : oneDay
    }
    if months == 0 {
        correct = LocalizedStringKey("")
    }
    return correct
}

//
func dateOnlyString(from date: Date?) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    guard let date else { return "-.-.-" }
    return formatter.string(from: date)
}
func timeOnlyString(from date: Date?) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    guard let date else { return "-:-" }
    return formatter.string(from: date)
}


// Не используются
//func fetchHolidays(countryCode: String, year: Int) {
//    guard let url = URL(string: "https://date.nager.at/Api/v3/PublicHolidays/\(year)/\(countryCode)") else { return }
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        guard let data = data, error == nil else {
//            print("Error fetching data in fetchHolidays")
//            return
//        }
//        DispatchQueue.main.async {
//            do {
//                self.holidays = try JSONDecoder().decode([Holiday].self, from: data)
//            } catch {
//                print("Error decoding data in fetchHolidays")
//            }
//        }
//    }.resume()
//}
//
//func fetchWeekends(countryCode: String, year: Int) {
//    guard let url = URL(string: "https://date.nager.at/api/v3/longweekend/\(year)/\(countryCode)") else { return }
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        guard let data = data, error == nil else {
//            print("Error fetching data in fetchWeekends")
//            return
//        }
//        DispatchQueue.main.async {
//            do {
//                self.allWeekends = try JSONDecoder().decode([Weekend].self, from: data)
//            } catch {
//                print("Error decoding data in fetchWeekends")
//            }
//        }
//    }.resume()
//}
