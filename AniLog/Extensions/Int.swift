//
//  Int.swift
//  AniLog
//
//  Created by USER on 29/12/2021.
//

import Foundation

extension Int {
    func getMonthNameFromNumber() -> String {
        let monthName = DateFormatter().monthSymbols[self - 1]
        return monthName
    }
    
    func secondsToDaysHoursMinutes() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.unitsStyle = .full

        let formattedString = formatter.string(from: TimeInterval(self))!
        return formattedString
    }
    
    func timestampToFullDate() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "EEEE, d MMMM yyyy" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
}
