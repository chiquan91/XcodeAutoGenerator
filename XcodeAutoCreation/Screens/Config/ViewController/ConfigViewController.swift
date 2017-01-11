//
//  ConfigViewController.swift
//  XcodeAutoCreation
//
//  Created by Hoang Chi Quan on 12/18/16.
//  Copyright © 2016 Hoang Chi Quan. All rights reserved.
//

import Cocoa

class ConfigViewController: NSViewController {
    @IBOutlet weak var txtProjectFile: NSTextField!
    @IBOutlet weak var txtModuleName: NSTextField!
    @IBOutlet weak var txtDirectory: NSTextField!

    @IBAction func btnOkClicked(_ sender: NSButton) {
        let project = txtProjectFile.stringValue
//        if project.isEmpty {
//            AlertController.alert("drag project you want to modify")
//            return
//        }
        let directory = txtDirectory.stringValue
        if directory.isEmpty {
            AlertController.alert("drag directory where you want to create module")
            return
        }
        let name = txtModuleName.stringValue
        if name.isEmpty {
            AlertController.alert("enter module name")
            return
        }
        
        PBXHandler.shared.add(folder: name, to: project, in: directory) { [weak self] isSuccess in
            if isSuccess {
                self?.txtModuleName.stringValue = ""
                AlertController.alert("success")
            }
        }
    }
    
    private func runPythonCode() {
        guard let scriptPath = Bundle.main.path(forResource: "__main__", ofType: "py") else {
            return
        }
        var arguments: [String] = [scriptPath]
        arguments.append("--help")
        
        let outPipe = Pipe()
        let errorPipe = Pipe()
        
        let task = Process()
        task.launchPath = "/usr/bin/python"
        task.arguments = arguments
        task.standardInput = Pipe()
        task.standardOutput = outPipe
        task.standardError = errorPipe
        task.launch()
        
        let data = outPipe.fileHandleForReading.readDataToEndOfFile()
        let errorMessage = errorPipe.fileHandleForReading.readDataToEndOfFile()
        task.waitUntilExit()
        
        let exitCode = task.terminationStatus
        if exitCode != 0 {
            print("Error: \(errorMessage)")
        } else {
            print("Data: \(String.init(data: data, encoding: .ascii))")
        }
    }
}

