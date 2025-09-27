# DateCalc

[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://swift.org/package-manager/)
[![Platforms](https://img.shields.io/badge/Platforms-macOS%20%7C%20iOS-blue.svg)](https://swift.org)
[![Swift](https://img.shields.io/badge/Swift-5.10+-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Библиотека для юридически значимого подсчёта дней (календарных, рабочих), часов (общих, рабочих) с учётом российских праздников и переносов выходных дней.

<img width="788" alt="image" src="https://github.com/user-attachments/assets/ea4eef62-def0-4ed0-ab83-0f310a8a2ef5">

## ✨ Особенности

- 📅 **Точные расчёты**: Учёт российских праздников и переносов выходных дней
- ⚖️ **Юридическая точность**: Соответствие Трудовому кодексу РФ
- 🏛️ **Полный календарь**: Данные с 2015 по 2026 год включительно
- 🔧 **Простота использования**: Чистый Swift API
- 📱 **Кроссплатформенность**: iOS 15+ и macOS 13+
- 🎯 **Расширения типов**: Удобные методы для `Date` и `Int`

## 📦 Установка

### Swift Package Manager (Рекомендуется)

В Xcode выберите **File > Swift Packages > Add Package Dependency** и введите:

```
https://github.com/SergeiKriukov/DateCalc.git
```

Или добавьте в ваш `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/SergeiKriukov/DateCalc.git", .upToNextMajor(from: "1.0.0"))
]
```

### Ручная установка

1. Скачайте папку `Sources/DateCalc`
2. Перетащите её в ваш Xcode проект
3. Убедитесь, что включены опции `Copy items if needed` и `Create groups`

## 🚀 Быстрый старт

```swift
import DateCalc
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Подсчёт рабочих дней между датами
            let workingDays = daysBetweenDates(
                country: "RU",
                region: "",
                subregion: "",
                calendarType: "working",
                startDate: Date(),
                endDate: Date().byAdding(30),
                includeFirstDay: false
            )

            Text("Рабочих дней: \(workingDays.1.count)")

            // Определение даты через N рабочих дней
            let futureDate = dateAfterDays(
                country: "RU",
                region: "",
                subregion: "",
                calendarType: "working",
                initialDate: Date(),
                days: 10,
                workingDaysOnly: true,
                directionFuture: true
            )

            Text("Дата через 10 рабочих дней: \(futureDate.0.shortFormat)")
        }
    }
}
```

## 📚 API Документация

### 🎯 Основные функции расчёта

#### `daysBetweenDates(country:region:subregion:calendarType:startDate:endDate:includeFirstDay:)`
Супер-функция для расчёта количества дней между двумя датами с учётом рабочих/выходных дней.

```swift
let result = daysBetweenDates(
    country: "RU",
    region: "",
    subregion: "",
    calendarType: "working",
    startDate: Date(),
    endDate: Date().byAdding(30),
    includeFirstDay: false
)
// Возвращает: (Int, [Date], [Date], [Date], Bool, Date?)
```

#### `dateAfterDays(country:region:subregion:calendarType:initialDate:days:workingDaysOnly:directionFuture:)`
Определяет дату через заданное количество дней от исходной даты.

```swift
let (date, description) = dateAfterDays(
    country: "RU",
    region: "",
    subregion: "",
    calendarType: "working",
    initialDate: Date(),
    days: 15,
    workingDaysOnly: true,  // Только рабочие дни
    directionFuture: true   // В будущее
)
```

#### `nextWorkingAfter(_ date: Date) -> Date`
Находит следующий рабочий день после указанной даты.

```swift
let nextWorkingDay = nextWorkingAfter(Date())
```

#### `daysBetween(startDate:endDate:) -> Int`
Простой подсчёт календарных дней между двумя датами.

```swift
let days = daysBetween(startDate: startDate, endDate: endDate)
```

### 🕐 Функции конвертации и форматирования

#### Из Unix timestamp:
- `dateTimeString(from unixTime: Int) -> String` - `"2024-01-01 12:00:00"`
- `dateString(from unixTime: Int) -> String` - Короткая дата
- `timeString(from unixTime: Int) -> String` - Только время

#### Парсинг дат:
- `safeDateFrom(stringDate: String?) -> Date` - Безопасное получение даты
- `dateFromServerString(stringDate: String?) -> Date?` - Из формата `"yyyy-MM-dd HH:mm:ss"`
- `dateFromParserString(stringDate: String?) -> Date?` - Из формата `"dd.MM.yyyy"`

#### Утилиты:
- `dateOrStubFrom(serverDate: String?, stub: String) -> String` - Дата или заглушка
- `daysToday(from serverDate: String?) -> Int` - Дней от серверной даты до сегодня

### 🇷🇺 Локализация и склонение

#### Склонение числительных:
- `corrected(days: Int) -> LocalizedStringKey` - Дни (день/дня/дней)
- `correctedRU(days: Int) -> String` - Дни на русском
- `corrected(years: Int) -> LocalizedStringKey` - Годы (год/года/лет)
- `corrected(months: Int) -> LocalizedStringKey` - Месяцы (месяц/месяца/месяцев)

### 👨‍💼 Класс DateManager

Singleton для управления датами: `DateManager.shared`

#### Проверки дат:
```swift
// Проверки unix timestamp
DateManager.shared.isToday(unixTimestamp) // Сегодня?
DateManager.shared.isTodayOrYesterday(unixTimestamp) // Сегодня или вчера?

// Сравнение с датами
DateManager.shared.isStringDate(serverDate, before: date) // Раньше даты?
DateManager.shared.isStringDate(serverDate, after: date)  // Позже даты?
DateManager.shared.isStringDate(serverDate, between: start, and: end) // В диапазоне?
```

#### Работа с периодами:
```swift
DateManager.shared.days(from: startDate, to: endDate) // Количество дней
DateManager.shared.hoursOf(date) // Часов в дате
```

#### Рабочие дни:
```swift
DateManager.shared.isWorking(date) // Рабочий день? (пн-пт)
DateManager.shared.isRealWorking(date) // Реальный рабочий день с учётом праздников
```

#### Арифметика дат:
```swift
DateManager.shared.nextAfter(date, days: 5)   // Через 5 дней
DateManager.shared.nextAfter(date, months: 2) // Через 2 месяца
DateManager.shared.nextAfter(date, years: 1)  // Через год
DateManager.shared.nextAfter(date, weeks: 3)  // Через 3 недели
```

#### Форматирование и отображение:
```swift
DateManager.shared.dateFromShort("25.12.2024", time: "14:30") // Дата из строки
DateManager.shared.daysText(date) // Текстовое представление периода
DateManager.shared.yearMonthsText(startDate: start, endDate: end) // Период в годах/месяцах
```

### 🏖️ Класс HolidayData

Singleton с данными о праздниках: `HolidayData.shared`

#### `specialDays: [SpecialDay]`
Массив всех специальных дней (праздники, переносы) с 2015 по 2026 год.

```swift
struct SpecialDay {
    let stringDate: String  // "yyyy-MM-dd"
    let isWorking: Bool     // true = рабочий, false = выходной
}
```

### 📅 Расширение Date

Удобные свойства и методы для работы с датами.

#### Границы периодов:
```swift
date.weekStart   // Начало недели
date.weekEnd     // Конец недели
date.monthStart  // Начало месяца
date.monthEnd    // Конец месяца
date.yearStart   // Начало года
date.yearEnd     // Конец года
```

#### Компоненты даты:
```swift
date.dayInt    // День месяца (1-31)
date.monthInt  // Месяц (1-12)
date.yearInt   // Год
```

#### Форматы строк:
```swift
date.shortFormat       // "25.12.2024"
date.shortFormatHM     // "25.12.2024 14:30"
date.serverFormat      // "2024-12-25 14:30:00"
date.shortServerFormat // "2024-12-25"
date.logFormat         // "14:30:00"
```

#### Unix форматы:
```swift
date.unixFormat        // Int timestamp
date.todayUnixFormat   // Timestamp на сегодня
```

#### Проверки:
```swift
date.isToday           // Сегодня?
date.isBeforeToday     // Раньше сегодня?
date.isWorking         // Рабочий день? (пн-пт)
date.isTodayOrTomorrow // Сегодня или завтра?
date.isTodayOrYesterday // Сегодня или вчера?
```

#### Навигация:
```swift
date.nextDay           // Следующий день
date.dayBefore         // Предыдущий день
date.startOfDay        // Начало дня (00:00)
date.endOfDay          // Конец дня (23:59)
date.zeroHours         // Дата без времени
```

#### Арифметика:
```swift
date.byAdding(5)           // +5 дней
date.byAddingMonths(2)     // +2 месяца
date.byAddingYears(1)      // +1 год
date.byAddingMinutes(90)   // +90 минут
```

### 🔢 Расширение Int

#### `absolute: Int`
Модуль числа (абсолютное значение).

```swift
let positive = (-5).absolute // 5
let stillPositive = 10.absolute // 10
```

### 📋 Модели данных

#### `CalendarDataPoint`
Точка данных для календаря (id, date, value).

#### `LegalEvent`
Юридические события с типичными сроками.

```swift
struct LegalEvent {
    let title: String  // Название события
    let label: String  // Срок (например, "1 месяц")
    let months: Int
    let days: Int
}
```

#### `legalEvents: [LegalEvent]`
Предопределённые юридические события:
- "Вынесено решение суда" (1 месяц)
- "Вынесено определение об обеспечительных мерах" (15 рабочих дней)
- "Вынесено апелляционное определение суда" (3 месяца)
- "Вынесено кассационное определение суда" (3 месяца)

#### `ExpirationPeriod`
Перечисление периодов истечения срока.

```swift
enum ExpirationPeriod: Int {
    case year        // Через год
    case halfYear    // Через полгода
    case quarter     // Через квартал
    case month       // Через месяц
    case halfMonth   // Через полмесяца
    case week        // Через неделю
    case days        // Через дни
}
```

## 💡 Примеры использования

### Расчёт срока исковой давности

```swift
// Дата подачи иска
let filingDate = Date()

// Дата истечения срока (3 года)
let expirationDate = DateManager.shared.nextAfter(filingDate, years: 3)

// Проверка, не истёк ли срок
let isExpired = DateManager.shared.isStringDate(nil, before: expirationDate)
```

### Подсчёт рабочих дней в месяце

```swift
let calendar = Calendar.current
let components = calendar.dateComponents([.year, .month], from: Date())
let startOfMonth = calendar.date(from: components)!

let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!

let result = daysBetweenDates(
    country: "RU", region: "", subregion: "",
    calendarType: "working",
    startDate: startOfMonth,
    endDate: endOfMonth,
    includeFirstDay: true
)

print("Рабочих дней в месяце: \(result.1.count)")
```

### Форматирование дат для отображения

```swift
extension Date {
    var displayFormat: String {
        if self.isToday {
            return "Сегодня"
        } else if self.isTodayOrYesterday(Date().timeIntervalSince1970.unixFormat) {
            return "Вчера"
        } else {
            return self.shortFormat
        }
    }
}
```

### Работа с юридическими сроками

```swift
func calculateDeadline(from event: LegalEvent, startDate: Date) -> Date {
    var resultDate = DateManager.shared.nextAfter(startDate, months: event.months)
    resultDate = DateManager.shared.nextAfter(resultDate, days: event.days)

    // Если последний день выпадает на выходной, переносим на следующий рабочий
    if !DateManager.shared.isRealWorking(resultDate) {
        resultDate = nextWorkingAfter(resultDate)
    }

    return resultDate
}

// Использование
let courtDecision = legalEvents[0] // Решение суда - 1 месяц
let deadline = calculateDeadline(from: courtDecision, startDate: Date())
```

## 🎯 Продвинутые возможности

### Учёт праздников и переносов

Библиотека автоматически учитывает:
- ✅ Новогодние каникулы (1-8 января)
- ✅ Рождество Христово (7 января)
- ✅ День защитника Отечества (23 февраля)
- ✅ Международный женский день (8 марта)
- ✅ Праздник Весны и Труда (1 мая)
- ✅ День Победы (9 мая)
- ✅ День России (12 июня)
- ✅ День народного единства (4 ноября)
- ✅ Все переносы выходных дней по постановлениям правительства

### Локализация

Автоматическая локализация для русского языка:
- Правильное склонение числительных
- Локализованные строки для интерфейса
- Поддержка русской локали в форматерах дат

## 📋 Требования

- **iOS**: 15.0+
- **macOS**: 13.0+
- **Swift**: 5.10+
- **Xcode**: 14.0+

## 🧪 Тестирование

```bash
swift test
```

## 📄 Лицензия

DateCalc доступна под лицензией MIT. Подробности в файле [LICENSE](LICENSE).

## 🤝 Вклад в развитие

Все issue reports, feature requests, pull requests и GitHub звёзды приветствуются!

### Как внести вклад:
1. Fork репозиторий
2. Создайте feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit изменения (`git commit -m 'Add some AmazingFeature'`)
4. Push в branch (`git push origin feature/AmazingFeature`)
5. Откройте Pull Request

## 📞 Автор

**Sergei Kriukov**

## 🌟 Поддержка проекта

Если вам нравится проект, поставьте звезду! ⭐

## 📱 Проекты, использующие DateCalc

- [Название проекта](ссылка) - Описание использования

---

*Создано с ❤️ для юридического сообщества*
