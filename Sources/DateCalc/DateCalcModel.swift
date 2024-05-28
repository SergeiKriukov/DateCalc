
import SwiftUI

struct Holiday: Decodable {
    let date: String // 2024-02-24
    let localName: String
    let countryCode: String
}

struct Weekend: Decodable {
    let startDate: String // 2024-02-24
    let endDate: String
}

public struct CalendarDataPoint: Identifiable {
    public let id = UUID()
    public let date: Date
    public let value: Double // Постоянное значение для Y - REMOVE
}

public struct SpecialDay {
    public let stringDate: String
    public let isWorking: Bool
}








// Явно не нужно здесь
public enum ExpirationPeriod: Int, CaseIterable {
    case year = 0
    case halfYear
    case quarter
    case month
    case halfMonth
    case week
    case days
    
   public var description: String {
        switch self {
        case .year:
            return "Истекает через год"
        case .halfYear:
            return "Истекает через полгода"
        case .quarter:
            return "Истекает через квартал"
        case .month:
            return "Истекает через месяц"
        case .halfMonth:
            return "Истекает через полмесяца"
        case .week:
            return "Истекает через неделю"
        case .days:
            return "Истекает через дни"
        }
    }
    
   public var title: String {
        switch self {
        case .year:
            return "Найти дату, в которую истекает срок, исчисляемый годами"
        case .halfYear:
            return "Найти дату, в которую истекает срок, исчисляемый в полгода (это как месяцы)"
        case .quarter:
            return "Найти дату, в которую истекает срок, исчисляемый кварталами (это как месяцы, квартал = 3 месяцем)"
        case .month:
            return "Найти дату, в которую истекает срок, исчисляемый месяцами"
        case .halfMonth:
            return "Найти дату, в которую истекает срок, исчисляемый в полмесяца (это как дни, полмесяца = 15 дням)"
        case .week:
            return "Найти дату, в которую истекает срок, исчисляемый неделями"
        case .days:
            return "Найти дату по заданному количеству дней от исходной даты"
        }
    }

   public var units: String {
        switch self {
        case .year:
            return "лет"
        case .halfYear:
            return ""
        case .quarter:
            return "кварталов"
        case .month:
            return "месяцев"
        case .halfMonth:
            return ""
        case .week:
            return "недель"
        case .days:
            return "дней"
        }
    }

    
}

public struct LegalEvent {
    public let title: String
    public let label: String
    public let months: Int
    public let days: Int
}

public let legalEvents = [
    LegalEvent(
        title: "Вынесено решение суда",
        label: "1 месяц",
        months: 1,
        days: 0
    ),
    LegalEvent(
        title: "Вынесено определение об обеспечительных мерах",
        label: "15 рабочих дней",
        months: 0,
        days: 15
    ),
    LegalEvent(
        title: "Вынесено апелляционное определение суда",
        label: "3 месяца",
        months: 3,
        days: 0
    ),
    LegalEvent(
        title: "Вынесено кассационное определение суда",
        label: "3 месяца",
        months: 3,
        days: 0
    )

]

//let qlegalEvents = ["Вынесено решение суда", "Вынесено определение об обеспечительных мерах", "Вынесено апелляционное определение суда", "Вынесено кассационное определение суда"]
//let deadlines = ["1 месяц", "15 рабочих дней", "3 месяца", "3 месяца"]

