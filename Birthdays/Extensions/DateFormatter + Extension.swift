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
