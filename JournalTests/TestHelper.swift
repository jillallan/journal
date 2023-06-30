//
//  TestHelper.swift
//  JournalTests
//
//  Created by Jill Allan on 12/06/2023.
//

import Foundation

struct TestHelper {
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    // Update to exclude current date
    static func randomDate() -> Date {
        let day = Int.random(in: 1..<28)
        let month = Int.random(in: 1..<13)
        let year = Int.random(in: 2020..<2023)
        
        let dateComponents = DateComponents(calendar: Calendar.current, year: year, month: month, day: day)
        let date = dateComponents.date
        return date ?? Date.now
    }
}
