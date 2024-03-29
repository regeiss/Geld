//
//  CalendarExtension.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 03/03/24.
//

import Foundation

extension Calendar
{
    func numberOfDaysBetween(_ from: Date, and toDate: Date) -> Int
    {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: toDate)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day! + 1
    }
}
