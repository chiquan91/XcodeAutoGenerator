//
//  DragDirectoryView.swift
//  XcodeAutoCreation
//
//  Created by Hoang Chi Quan on 12/18/16.
//  Copyright © 2016 Hoang Chi Quan. All rights reserved.
//

import Cocoa

class DragDirectoryView: NSView {
    var didDragDirectory: ((String) -> Void)?
    fileprivate var isHighlighted = false {
        didSet {
            setNeedsDisplay(bounds)
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        if isHighlighted {
            NSBezierPath.setDefaultLineWidth(6)
            NSColor.keyboardFocusIndicatorColor.set()
            NSBezierPath.stroke(bounds)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        register(forDraggedTypes: [NSFilenamesPboardType])
    }
    
    // MARK: - Dragging
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        isHighlighted = true
        return NSDragOperation.every
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        isHighlighted = false
    }
    
    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return true
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        isHighlighted = false
        return true
    }

    override func concludeDragOperation(_ sender: NSDraggingInfo?) {
        if let files: [String] = sender?.draggingPasteboard().propertyList(forType: NSFilenamesPboardType) as? [String] {
            didDragDirectory?(files[0])
        }
    }
}
