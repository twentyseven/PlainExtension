//
//  Date.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 12/21/19.
//
//

public extension Date {
    var yesterday: Date { return dayBefore }

    var tomorrow: Date { return dayAfter }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }

    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }

    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    var isLastDayOfMonth: Bool {
        let startOfCurrent = Calendar.current.startOfDay(for: self)
        let dayAfter = Calendar.current.date(byAdding: .day, value: 1, to: startOfCurrent)
        return dayAfter?.month != month
    }

    func toString(format: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        return dateFormater.string(from: self)
    }

    func dayDifference(from date: Date, useStartOfDate: Bool = true) -> Int {
        let calendar = Calendar.current
        let startOfCurrent = useStartOfDate ? calendar.startOfDay(for: self) : self
        let startOfDate = useStartOfDate ? calendar.startOfDay(for: date) : date
        let components = calendar.dateComponents([.day], from: startOfDate, to: startOfCurrent)
        return components.day ?? 0
    }

    func set(calendar: Calendar = .autoupdatingCurrent,
             year: Int? = nil,
             month: Int? = nil,
             day: Int? = nil,
             hour: Int? = nil,
             minute: Int? = nil,
             second: Int? = nil) -> Date {
        let components = Set<Calendar.Component>(arrayLiteral: .year, .month, .day, .hour, .minute, .second)
        var dateComponents = calendar.dateComponents(components, from: self)

        dateComponents.year = year ?? dateComponents.year
        dateComponents.month = month ?? dateComponents.month
        dateComponents.day = day ?? dateComponents.day
        dateComponents.hour = hour ?? dateComponents.hour
        dateComponents.minute = minute ?? dateComponents.minute
        dateComponents.second = second ?? dateComponents.second

        guard let date = calendar.date(from: dateComponents) else {
            fatalError("unexpected date")
        }
        return date
    }
}
