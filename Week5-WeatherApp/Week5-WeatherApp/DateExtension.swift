//
//  DateExtension.swift
//  Week5-WeatherApp
//
//  Created by 김상혁 on 2021/12/01.
//

import Foundation

extension Date {
    func toStringUTC(_ timezone: Int ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
        return dateFormatter.string(from: self)
    }
}
