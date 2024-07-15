//
//  DateTimeHelper.swift
//  CourseWork2Starter
//
//  Created by Mason Stephens on 13/07/2024.
//

import Foundation

func formatUnixTime(_ timestamp: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ha" // Format as "9PM"
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"
    return dateFormatter.string(from: date)
}

func getFormattedDate(date: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E dd"
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        return dateFormatter.string(from: date)
    }

func formatDate(unixTimestamp: Int, format: String, timezone: String?) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    if let timezone = timezone {
        dateFormatter.timeZone = TimeZone(identifier: timezone)
    }
    return dateFormatter.string(from: date)
}
