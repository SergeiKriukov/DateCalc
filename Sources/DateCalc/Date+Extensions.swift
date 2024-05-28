//
//  Date+Extensions.swift
//
//  Created by Evgeny Turchaninov on 28.05.2024.
//

import Foundation

public extension Date {
    
    var weekStart: Date {
        let calendar = Calendar.current
        guard let dateInterval = calendar.dateInterval(
            of: .weekOfYear,
            for: self
        ) else {
            return self
        }
        return calendar.startOfDay(for: dateInterval.start) 
    }
    
    var weekEnd: Date {
        let calendar = Calendar.current
        guard let dateInterval = calendar.dateInterval(
            of: .weekOfYear,
            for: self
        ) else {
            return self
        }
        return calendar.date(byAdding: DateComponents(minute: -1), to: dateInterval.end ) ?? self
    }

    var monthStart: Date {
        let calendar = Calendar.current
        guard let dateInterval = calendar.dateInterval(
            of: .month,
            for: self
        ) else {
            return self
        }
        return calendar.startOfDay(for: dateInterval.start)
    }
    
    var monthEnd: Date {
        let calendar = Calendar.current
        guard let dateInterval = calendar.dateInterval(
            of: .month,
            for: self
        ) else {
            return self
        }
        return calendar.date(byAdding: DateComponents(minute: -1), to: dateInterval.end ) ?? self
    }

    var yearStart: Date {
        let calendar = Calendar.current
        guard let dateInterval = calendar.dateInterval(
            of: .year,
            for: self
        ) else {
            return self
        }
        return calendar.startOfDay(for: dateInterval.start)
    }
    
    var yearEnd: Date {
        let calendar = Calendar.current
        guard let dateInterval = calendar.dateInterval(
            of: .year,
            for: self
        ) else {
            return self
        }
        return calendar.date(byAdding: DateComponents(minute: -1), to: dateInterval.end ) ?? self
    }

    
    var dayInt: Int {
        let components = Calendar.current.dateComponents([.day], from: self)
        return components.day ?? 0
    }
    var monthInt: Int {
        let components = Calendar.current.dateComponents([.month], from: self)
        return components.month ?? 0
    }
    var yearInt: Int {
        let components = Calendar.current.dateComponents([.year], from: self)
        return components.year ?? 0
    }
    
    // MARK: - Formatters
    
    /// "dd.MM.yyyy EE"
    var shortWeekFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy EE"
        return dateFormatter.string(from: self)
    }

    /// "yyyy-MM-dd"
    var shortServerFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }

    /// "dd.MM.yyyy"
    var shortFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }

    /// "yyyy-MM-dd HH:mm:ss"
    var serverFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    ///  today in unix format
    var todayUnixFormat: Int {
        Int(timeIntervalSince1970)
    }

    /// Int unix format for server
    var unixFormat: Int {
        Int(self.timeIntervalSince1970)
    }

    /// "HH:mm:ss"
    var logFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: self)
    }

    // MARK: - Checkers

    var isToday: Bool {
        self >= Date().startOfDay && self <= Date().endOfDay
    }

    
    var isBeforeToday: Bool {
        self <= Date().endOfDay
    }

    /// Check, that day is working or not (Mon...Fri)
    var isWorking: Bool {
        let dateComponents = Calendar.current.dateComponents([.weekday], from: self)
        let weekDay = dateComponents.weekday ?? 0
        return weekDay > 1 && weekDay < 7
    }

    var isTodayOrTomorrow: Bool {
        self >= Date().startOfDay && self <= Date().nextDay.endOfDay
    }

    var isTodayOrYesterday: Bool {
        self >= Date().dayBefore.startOfDay && self <= Date().endOfDay
    }
    
    var isTodayUntilWeekEnd: Bool {
        self >= Date().startOfDay && self <= Date().weekEnd
    }
    
    /// if Date is in unix format (Int)
    func isTodayOrYesterday(_ date: Int) -> Bool {
        let start = Date().dayBefore.startOfDay.unixFormat
        let finish = Date().endOfDay.unixFormat
        return date >= start && date <= finish
    }
    
    /// if Date is in unix format (Int)
    func isToday(_ date: Int) -> Bool {
        let start = Date().startOfDay.unixFormat
        let finish = Date().endOfDay.unixFormat
        return date >= start && date <= finish
    }

    // MARK: - Helpers
    
    var nextDay: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self) ?? Date()
    }

    var dayBefore: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self) ?? Date()
    }

    var workingStartOfDay: Date {
        self.startOfDay.byAddingMinutes(60 * 9)
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        Calendar.current.date(byAdding: DateComponents(day: 1, minute: -1), to: self.startOfDay)!
    }

    func byAddingMinutes(_ minutes: Int) -> Date {
        Calendar.current.date(byAdding: DateComponents(minute: minutes), to: self)!
    }
    
    func byAdding(_ days: Int) -> Date {
        Calendar.current.date(byAdding: DateComponents(day: days), to: self.startOfDay)!
    }

    func byAddingMonths(_ months: Int) -> Date {
        Calendar.current.date(byAdding: DateComponents(month: months), to: self)!
    }

    func byAddingYears(_ years: Int) -> Date {
        Calendar.current.date(byAdding: DateComponents(year: years), to: self)!
    }

}
