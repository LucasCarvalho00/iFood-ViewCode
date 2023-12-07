//
//  Extension+NSObject.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation

extension NSObject {
    static var className: String {
        return NSStringFromClass(self)
            .components(separatedBy: ".")
            .last ?? NSStringFromClass(self)
    }
}
