import SwiftUI

public final class HolidayData {
    public static let shared = HolidayData()
    public var specialDays = [SpecialDay]()
    
    private init() {
        composeSpecialDays()
    }

    // Дни, которые отличаются от других - рабочие выходные и нерабочие будни
    // пока вносятся вручную
    
//    Пример формата:
//    Перенести в 2023 году следующие выходные дни:
//    с воскресенья 1 января на пятницу 24 февраля;
//    с воскресенья 8 января на понедельник 8 мая.
//    - это значит что день 2023-02-24 был рабочим, станет выходным:
 //   SpecialDay(stringDate: "2023-02-24", isWorking: false),
    // при этом 1 января был выходным, но это официальный праздник, поэтому его перенесли
    
    
    func composeSpecialDays() {
        specialDays = [
            // 2015 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2015-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2015-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2015-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2015-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2015-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2015-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2015-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2015-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2015-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2015-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2015-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2015-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2015-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2015-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2015-01-09", isWorking: false),

            // 2016 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2016-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2016-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2016-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2016-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2016-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2016-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2016-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2016-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2016-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2016-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2016-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2016-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2016-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2016-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2016-05-03", isWorking: false),
            SpecialDay(stringDate: "2016-03-07", isWorking: false),
            SpecialDay(stringDate: "2016-02-22", isWorking: false),

            // 2017 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2017-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2017-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2017-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2017-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2017-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2017-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2017-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2017-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2017-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2017-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2017-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2017-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2017-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2017-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2017-02-24", isWorking: false),
            SpecialDay(stringDate: "2017-05-08", isWorking: false),

            // 2018 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2018-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2018-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2018-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2018-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2018-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2018-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2018-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2018-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2018-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2018-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2018-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2018-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2018-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2018-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2018-03-09", isWorking: false),
            SpecialDay(stringDate: "2018-05-02", isWorking: false),
            SpecialDay(stringDate: "2018-04-30", isWorking: false),
            SpecialDay(stringDate: "2018-06-11", isWorking: false),
            SpecialDay(stringDate: "2018-12-31", isWorking: false),

            // 2019 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2019-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2019-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2019-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2019-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2019-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2019-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2019-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2019-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2019-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2019-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2019-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2019-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2019-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2019-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2019-05-02", isWorking: false),
            SpecialDay(stringDate: "2019-05-03", isWorking: false),
            SpecialDay(stringDate: "2019-05-10", isWorking: false),

            // 2020 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2020-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2020-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2020-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2020-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2020-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2020-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2020-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2020-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2020-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2020-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2020-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2020-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2020-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2020-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2020-05-04", isWorking: false),
            SpecialDay(stringDate: "2020-05-05", isWorking: false),

            // 2021 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2021-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2021-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2021-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2021-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2021-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2021-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2021-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2021-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2021-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2021-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2021-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2021-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2021-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2021-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2021-11-05", isWorking: false),
            SpecialDay(stringDate: "2021-12-31", isWorking: false),
            SpecialDay(stringDate: "2021-02-22", isWorking: false),

            // 2022 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2022-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2022-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2022-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2022-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2022-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2022-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2022-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2022-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2022-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2022-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2022-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2022-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2022-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2022-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2022-05-03", isWorking: false),
            SpecialDay(stringDate: "2022-05-10", isWorking: false),
            SpecialDay(stringDate: "2022-03-07", isWorking: false),

            // 2023 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2023-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2023-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2023-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2023-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2023-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2023-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2023-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2023-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2023-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2023-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2023-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2023-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2023-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2023-11-04", isWorking: false), // День народного единства
            SpecialDay(stringDate: "2023-02-24", isWorking: false),
            SpecialDay(stringDate: "2023-05-08", isWorking: false),
            SpecialDay(stringDate: "2024-01-01", isWorking: false),
            SpecialDay(stringDate: "2024-01-02", isWorking: false),
            SpecialDay(stringDate: "2024-01-03", isWorking: false),
            SpecialDay(stringDate: "2024-01-04", isWorking: false),
            SpecialDay(stringDate: "2024-01-05", isWorking: false),
            SpecialDay(stringDate: "2024-01-06", isWorking: false),
            SpecialDay(stringDate: "2024-01-07", isWorking: false),
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
            SpecialDay(stringDate: "2025-01-04", isWorking: false),
            SpecialDay(stringDate: "2025-01-05", isWorking: false),
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

            // 2026 - Стандартные праздники
            // Новогодние каникулы
            SpecialDay(stringDate: "2026-01-01", isWorking: false), // Новый год
            SpecialDay(stringDate: "2026-01-02", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2026-01-03", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2026-01-04", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2026-01-05", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2026-01-06", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2026-01-07", isWorking: false), // Рождество Христово
            SpecialDay(stringDate: "2026-01-08", isWorking: false), // Новогодние каникулы
            SpecialDay(stringDate: "2026-02-23", isWorking: false), // День защитника Отечества
            SpecialDay(stringDate: "2026-03-08", isWorking: false), // Международный женский день
            SpecialDay(stringDate: "2026-05-01", isWorking: false), // Праздник Весны и Труда
            SpecialDay(stringDate: "2026-05-09", isWorking: false), // День Победы
            SpecialDay(stringDate: "2026-06-12", isWorking: false), // День России
            SpecialDay(stringDate: "2026-11-04", isWorking: false), // День народного единства
            // Переносы выходных дней 2026 года (Постановление Правительства РФ)
            SpecialDay(stringDate: "2026-01-09", isWorking: false), // Перенос с субботы 3 января
            SpecialDay(stringDate: "2026-12-31", isWorking: false), // Перенос с воскресенья 4 января

        ]
    }

    
}
