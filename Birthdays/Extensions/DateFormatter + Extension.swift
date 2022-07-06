//
//  DateFormatter + Extension.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import Foundation.NSDateFormatter

extension DateFormatter {
    static let friendDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}

extension ISO8601DateFormatter {
    static let iso801Formatter: ISO8601DateFormatter = {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds]
        
        return isoDateFormatter
    }()
}
