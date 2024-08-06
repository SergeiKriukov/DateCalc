import SwiftUI

public final class HolidayData {
    public static let shared = HolidayData()
    public var specialDays = [SpecialDay]()
    
    private init() {
        composeSpecialDays()
    }

    // Дни, которые отличаются от других - рабочие выходные и нерабочие будни
    // пока вносятся вручную
    func composeSpecialDays() {
        specialDays = [
            SpecialDay(stringDate: "2024-01-01", isWorking: false),
            SpecialDay(stringDate: "2024-01-02", isWorking: false),
            SpecialDay(stringDate: "2024-01-03", isWorking: false),
            SpecialDay(stringDate: "2024-01-04", isWorking: false),
            SpecialDay(stringDate: "2024-01-05", isWorking: false),
            SpecialDay(stringDate: "2024-01-08", isWorking: false),
            SpecialDay(stringDate: "2024-02-23", isWorking: false),
            SpecialDay(stringDate: "2024-03-08", isWorking: false),
            SpecialDay(stringDate: "2024-04-27", isWorking: true),
            SpecialDay(stringDate: "2024-04-29", isWorking: false),
            SpecialDay(stringDate: "2024-04-30", isWorking: false),
            SpecialDay(stringDate: "2024-05-01", isWorking: false),
            SpecialDay(stringDate: "2024-05-09", isWorking: false),
            SpecialDay(stringDate: "2024-05-10", isWorking: false),
            SpecialDay(stringDate: "2024-06-12", isWorking: false),
            SpecialDay(stringDate: "2024-11-04", isWorking: false),
            SpecialDay(stringDate: "2024-12-28", isWorking: true),
            SpecialDay(stringDate: "2024-12-30", isWorking: false),
            SpecialDay(stringDate: "2024-12-31", isWorking: false),
            SpecialDay(stringDate: "2025-01-01", isWorking: false),
            SpecialDay(stringDate: "2025-01-02", isWorking: false),
            SpecialDay(stringDate: "2025-01-03", isWorking: false),
            SpecialDay(stringDate: "2025-01-06", isWorking: false),
            SpecialDay(stringDate: "2025-01-07", isWorking: false),
            SpecialDay(stringDate: "2025-01-08", isWorking: false),
            SpecialDay(stringDate: "2025-05-01", isWorking: false),
            SpecialDay(stringDate: "2025-05-02", isWorking: false),
            SpecialDay(stringDate: "2025-05-08", isWorking: false),
            SpecialDay(stringDate: "2025-05-09", isWorking: false),
            SpecialDay(stringDate: "2025-06-12", isWorking: false),
            SpecialDay(stringDate: "2025-06-13", isWorking: false),
            SpecialDay(stringDate: "2025-11-01", isWorking: true),
            SpecialDay(stringDate: "2025-11-03", isWorking: false),
            SpecialDay(stringDate: "2025-11-04", isWorking: false),
            SpecialDay(stringDate: "2025-12-31", isWorking: false),

        ]
    }

    
}
