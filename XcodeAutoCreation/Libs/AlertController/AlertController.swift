//
//  AlertController.swift
//  XcodeAutoCreation
//
//  Created by Hoang Chi Quan on 12/19/16.
//  Copyright © 2016 Hoang Chi Quan. All rights reserved.
//

import Cocoa

class AlertController {
    final class func alert(_ message: String) {
        let alert = NSAlert()
        alert.addButton(withTitle: "Ok")
        alert.messageText = message
        alert.runModal()
    }
}
