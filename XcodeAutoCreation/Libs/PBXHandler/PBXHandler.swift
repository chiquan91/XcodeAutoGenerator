//
//  PBXHandler.swift
//  XcodeAutoCreation
//
//  Created by Hoang Chi Quan on 12/19/16.
//  Copyright © 2016 Hoang Chi Quan. All rights reserved.
//

import Cocoa

class PBXHandler: NSObject {
    static let shared = PBXHandler()
    
    final func add(folder name: String, to project: String, in directory: String, success: ((_ isSuccess: Bool) -> Void)?) {
        add(folder: name, in: directory) { isSuccess in
            success?(isSuccess)
        }
        
//        OCPPClass.addFiles(name, toProject: project)
    }
    
    // MARK: - Private
    
    fileprivate func add(folder name: String, in directory: String, success: ((_ isSuccess: Bool) -> Void)?) {
        do {
            try FileManager.default.createDirectory(atPath: "\(directory)/\(name)", withIntermediateDirectories: true, attributes: nil)
            
            try FileManager.default.createDirectory(atPath: "\(directory)/\(name)/ViewController", withIntermediateDirectories: true, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(directory)/\(name)/ViewModel", withIntermediateDirectories: true, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(directory)/\(name)/CustomViews", withIntermediateDirectories: true, attributes: nil)
            
            let contentOfViewController = self.contentOfViewController(moduleName: name, superClassName: "UIViewController", appName: "Rize", author: "Hoang Chi Quan", organization: "Vmodev")
            FileManager.default.createFile(atPath: "\(directory)/\(name)/ViewController/\(name)ViewController.swift", contents: contentOfViewController, attributes: nil)
            
            let contentOfViewControllerXib = self.contentOfViewControllerXib(moduleName: name)
            FileManager.default.createFile(atPath: "\(directory)/\(name)/ViewController/\(name)ViewController.xib", contents: contentOfViewControllerXib, attributes: nil)
            
            let contentOfViewModel = self.contentOfViewModel(moduleName: name, appName: "Rize", author: "Hoang Chi Quan", organization: "Vmodev")
            FileManager.default.createFile(atPath: "\(directory)/\(name)/ViewModel/\(name)ViewModel.swift", contents: contentOfViewModel, attributes: nil)
            
            success?(true)
        } catch {
            print(error) 
            success?(false)
        }
    }
    
    func contentOfViewController(moduleName name: String, superClassName: String, appName: String, author: String, organization: String) -> Data? {
        var vcText = ""
        vcText += "//\n"
        vcText += "//  \(name)ViewController.swift\n"
        vcText += "//  \(appName)\n"
        vcText += "//\n"
        vcText += "//  Created by \(author) on \(Date().dateString(format: "MM/dd/yyyy")).\n"
        vcText += "//  Copyright © \(Date().dateString(format: "yyyy")) \(organization). All rights reserved.\n"
        vcText += "//\n"
        vcText += "\n"
        vcText += "import UIKit\n"
        vcText += "\n"
        vcText += "class \(name)ViewController: \(superClassName) {\n"
        vcText += "    // MARK: - Outlets\n"
        vcText += "\n"
        vcText += "    // MARK: - Vars\n"
        vcText += "\n"
        vcText += "    // MARK: - Life cycle\n"
        vcText += "    override func viewDidLoad() {\n"
        vcText += "        super.viewDidLoad()\n"
        vcText += "\n"
        vcText += "    }\n"
        vcText += "\n"
        vcText += "    override func viewWillAppear(_ animated: Bool) {\n"
        vcText += "        super.viewWillAppear(animated)\n"
        vcText += "\n"
        vcText += "    }\n"
        vcText += "\n"
        vcText += "    override func didReceiveMemoryWarning() {\n"
        vcText += "        super.didReceiveMemoryWarning()\n"
        vcText += "    }\n"
        vcText += "\n"
        vcText += "    // MARK: - Overrides\n"
        vcText += "\n"
        vcText += "    // MARK: - Actions\n"
        vcText += "\n"
        vcText += "    // MARK: - Privates\n"
        vcText += "\n"
        vcText += "    // MARK: - Publics\n"
        vcText += "\n"
        vcText += "}\n"
        return vcText.data(using: String.Encoding.utf8)
    }
    
    func contentOfViewControllerXib(moduleName name: String) -> Data? {
        var vcText = ""
        vcText += "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n"
        vcText += "<document type=\"com.apple.InterfaceBuilder3.CocoaTouch.XIB\" version=\"3.0\" toolsVersion=\"11134\" systemVersion=\"15F34\" targetRuntime=\"iOS.CocoaTouch\" propertyAccessControl=\"none\" useAutolayout=\"YES\" useTraitCollections=\"YES\" colorMatched=\"YES\">\n"
        vcText += "<dependencies>\n"
        vcText += "<plugIn identifier=\"com.apple.InterfaceBuilder.IBCocoaTouchPlugin\" version=\"11106\"/>\n"
        vcText += "<capability name=\"documents saved in the Xcode 8 format\" minToolsVersion=\"8.0\"/>\n"
        vcText += "</dependencies>\n"
        vcText += "<objects>\n"
        vcText += "<placeholder placeholderIdentifier=\"IBFilesOwner\" id=\"-1\" userLabel=\"File's Owner\" customClass=\"\(name)ViewController\" customModuleProvider=\"target\">\n"
        vcText += "<connections>\n"
        vcText += "<outlet property=\"view\" destination=\"i5M-Pr-FkT\" id=\"sfx-zR-JGt\"/>\n"
        vcText += "</connections>\n"
        vcText += "</placeholder>\n"
        vcText += "<placeholder placeholderIdentifier=\"IBFirstResponder\" id=\"-2\" customClass=\"UIResponder\"/>\n"
        vcText += "<view clearsContextBeforeDrawing=\"NO\" contentMode=\"scaleToFill\" id=\"i5M-Pr-FkT\">\n"
        vcText += "<rect key=\"frame\" x=\"0.0\" y=\"0.0\" width=\"375\" height=\"667\"/>\n"
        vcText += "<autoresizingMask key=\"autoresizingMask\" widthSizable=\"YES\" heightSizable=\"YES\"/>\n"
        vcText += "<color key=\"backgroundColor\" red=\"1\" green=\"1\" blue=\"1\" alpha=\"1\" colorSpace=\"custom\" customColorSpace=\"sRGB\"/>\n"
        vcText += "</view>\n"
        vcText += "</objects>\n"
        vcText += "</document>\n"

        return vcText.data(using: String.Encoding.utf8)
    }
    
    func contentOfViewModel(moduleName name: String, appName: String, author: String, organization: String) -> Data? {
        var vcText = ""
        vcText += "//\n"
        vcText += "//  \(name)ViewModel.swift\n"
        vcText += "//  \(appName)\n"
        vcText += "//\n"
        vcText += "//  Created by \(author) on \(Date().dateString(format: "MM/dd/yyyy")).\n"
        vcText += "//  Copyright © \(Date().dateString(format: "yyyy")) \(organization). All rights reserved.\n"
        vcText += "//\n"
        vcText += "\n"
        vcText += "import UIKit\n"
        vcText += "\n"
        vcText += "class \(name)ViewModel {\n"
        vcText += "\n"
        vcText += "}\n"
        return vcText.data(using: String.Encoding.utf8)
    }

}
