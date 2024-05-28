//
//  DateManager.swift
//
//  Created by Evgeny Turchaninov on 28.05.2024.
//

import SwiftUI

public final class DateManager {
    public static let shared = DateManager()
    private init() {}
    private let calendar = Calendar.current
    private let holidayData = HolidayData.shared
    
    /// Проверяет на сегодня дату в unix format
    public func isToday(_ date: Int) -> Bool {
        let start = Date().startOfDay.unixFormat
        let finish = Date().endOfDay.unixFormat
        return date >= start && date <= finish
    }
    
    /// Проверяет на сегодня или вчера дату в unix format
    public func isTodayOrYesterday(_ date: Int) -> Bool {
        let start = Date().dayBefore.startOfDay.unixFormat
        let finish = Date().endOfDay.unixFormat
        return date >= start && date <= finish
    }


    /// Сравнивает две даты,
    /// первая - в формате строки "yyyy-MM-dd"
    /// вторая - дата из pickera
    public func isStringDate(_ serverDate: String?, before: Date) -> Bool {
        if let date = serverDate {
            return safeDateFrom(stringDate: date) <= before
        } else {
            return false
        }
    }

    public func isStringDate(_ serverDate: String?, after: Date) -> Bool {
        if let date = serverDate {
            return safeDateFrom(stringDate: date) >= after
        } else {
            return false
        }
    }

    public func isStringDate(_ serverDate: String?, between start: Date, and end: Date) -> Bool {
        if let date = serverDate {
            return safeDateFrom(stringDate: date) >= start && safeDateFrom(stringDate: date) <= end
        } else {
            return false
        }
    }

    public func dateFromShort(_ dateString: String, time timeString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        var safeTime = "08:00"
        if timeString != "" {
            safeTime = timeString
        }
        return dateFormatter.date(from: "\(dateString) \(safeTime)") ?? Date()
    }

    public func days(from startDate: Date, to endDate: Date) -> Int {
        let dateComponents = calendar.dateComponents([.day], from: startDate, to: endDate)
        return dateComponents.day ?? 0
    }

    func hours(from startDate: Date, to endDate: Date) -> Int {
        let dateComponents = calendar.dateComponents([.day, .hour, .minute], from: startDate, to: endDate)
        return dateComponents.hour ?? 0
    }

    public func hoursOf(_ date: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let hourString = dateFormatter.string(from: date)
        return Int(hourString) ?? 0
    }

    public func nextAfter(_ date: Date, days: Int) -> Date {
        calendar.date(byAdding: .day, value: days, to: date) ?? Date()
    }

   public func isWorking(_ date: Date) -> Bool {
        let dateComponents = calendar.dateComponents([.weekday], from: date)
        let weekDay = dateComponents.weekday ?? 0
        let working = weekDay > 1 && weekDay < 7
        return working
    }

    /// для реальных рабочих дней
    public func isRealWorking(_ date: Date) -> Bool {
        if isWorking(date) && !holidayStrings.contains(date.shortServerFormat) {
            return true
        }
        if !isWorking(date) && workingStrings.contains(date.shortServerFormat) {
            return true
        }
        return false
    }

    /// Список всех настоящих дней между датами
    private var holidayStrings: [String] {
        holidayData.specialDays.filter{ !$0.isWorking }.map { $0.stringDate }
    }
    private var workingStrings: [String] {
        holidayData.specialDays.filter{ $0.isWorking }.map { $0.stringDate }
    }

    
    
    public func nextAfter(_ date: Date, years: Int) -> Date {
        calendar.date(byAdding: .year, value: years, to: date) ?? Date()
    }

    public func nextAfter(_ date: Date, months: Int) -> Date {
        calendar.date(byAdding: .month, value: months, to: date) ?? Date()
    }

    public func nextAfter(_ date: Date, weeks: Int) -> Date {
        calendar.date(byAdding: .weekOfYear, value: weeks, to: date) ?? Date()
    }

    public func daysText(_ date: Date?) -> Text {
        guard let safeDate = date else { return Text("--") }
        let periodBetween = daysBetween(startDate: Date(), endDate: safeDate)
        let past = periodBetween < 0
        let prefix = past ? "<-" : ""
        let suffix = past ? "" : "->"

        if periodBetween == 0 {
            return Text("today")
        }

        return
            Text(prefix).foregroundColor(past ? Color.secondary : Color.green) +
            Text(" \(periodBetween.absolute) д. ").foregroundColor(past ? Color.secondary : Color.green) +
            Text(suffix).foregroundColor(past ? Color.secondary : Color.green)
    }
    
    /// Конвертирует дни в годы
    public func yearMonthsText(startDate: Date, endDate: Date) -> Text {
        let start = startDate // today
        let end = endDate
        
        let periodBetween = daysBetween(startDate: startDate, endDate: endDate)
        let past = periodBetween < 0
        let prefix = past ? "прошло" : "через"
        
        if periodBetween == 0 {
            return Text("today")
        }

        var phraseText = Text("")
        
        let yearStart = start.yearInt
        let yearEnd = end.yearInt
        let monthStart = start.monthInt
        let monthEnd = end.monthInt
        let dayStart = start.dayInt
        let dayEnd = end.dayInt
            
        var years = yearEnd - yearStart
        var months = monthEnd - monthStart
        var days = dayEnd - dayStart

        // print("y: \(years)  m: \(months)  d: \(days)" )
        
        if years == 0 && months == 0 {
            let days = (dayEnd - dayStart).absolute
            phraseText = phraseText + Text("\(days)") + Text(" ") + Text(corrected(days: days)).foregroundColor(.gray)

        } else {
                        
            if past {
                if days > 0 {
                    days = 30 - days
                }

                if months > 0 {
                    months = 12 - months
                    
                    if days > 0 && years < 0 {
                        months -= 1
                    }
                    
                } else {
                    if days > 0 {
                        months += 1
                        if years < 0 {
                            months -= 1
                        }
                    }
                }
                
                if years < 0 {
                    if months > 0 {
                        years += 1
                    }
                }
            }
            
            days = days.absolute
            months = months.absolute
            years = years.absolute

            
            if years > 0 {
                phraseText = phraseText + Text("\(years) ") + Text(corrected(years: years)).foregroundColor(.gray) + Text("  ")
            }
            
            if months > 0 {
                phraseText = phraseText + Text("\(months) ") + Text(corrected(months: months)).foregroundColor(.gray) + Text("  ")
            }
            
            if days > 0 {
                phraseText = phraseText + Text("\(days) ") + Text(corrected(days: days)).foregroundColor(.gray)
            }
        }
        
        return Text(prefix) + Text(" ") + phraseText + Text("      \(periodBetween) дн.")
    }

}


