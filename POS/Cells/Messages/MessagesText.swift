//
//  MessagesText.swift
//  POS
//
//  Created by Malik Muhammad on 7/13/23.
//

import Cocoa

class MessagesText: NSTableCellView {
    
    
    @IBOutlet var awayStack: NSStackView!
    
    @IBOutlet var awayText: NSTextField!
    @IBOutlet var awayDate: NSTextField!
    
    @IBOutlet var homeStack: NSStackView!
    
    @IBOutlet var homeText: NSTextField!
    @IBOutlet var homeDate: NSTextField!
    
    
    

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
