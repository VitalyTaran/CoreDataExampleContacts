//
//  Data,String+Ext.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 31.08.2022.
//

import Foundation

extension Date {
    func convertToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: self)
    }
}

extension String {
    func convertToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.date(from: self)
    }
}

