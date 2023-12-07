//
//  Extension+String.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation

extension String {
    static func toDate(_ value: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        let date = dateFormatter.date(from: value)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date ?? Date())
    }
}
