//
//  StaffView.swift
//  POS
//
//  Created by Malik Muhammad on 7/17/23.
//

import Cocoa

class StaffView: NSTableCellView {

    @IBOutlet var individualImage: NSButton!
    @IBOutlet var individualName: NSTextField!
    @IBOutlet var lateThisWeek: NSTextField!
    @IBOutlet var lateThisMonth: NSTextField!
    @IBOutlet var hoursWorked: NSTextField!
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
