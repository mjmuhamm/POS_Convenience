//
//  InventoryList.swift
//  POS
//
//  Created by Malik Muhammad on 7/17/23.
//

import Cocoa

class InventoryList: NSTableCellView {

    @IBOutlet var product: NSTextField!
    @IBOutlet var quantity: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
