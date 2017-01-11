//
//  Date+Extensions.swift
//  XcodeAutoCreation
//
//  Created by Hoang Chi Quan on 1/10/17.
//  Copyright © 2017 Hoang Chi Quan. All rights reserved.
//

import Cocoa

extension Date {
    func dateString(format dateFormat: String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = dateFormat
        return dateformatter.string(from: self)
    }
}
