//
//  VendorsCell.swift
//  POS
//
//  Created by Malik Muhammad on 7/26/23.
//

import Cocoa

class VendorsCell: NSTableCellView {

    
    @IBOutlet var vendors: NSTextField!
    @IBOutlet var phone: NSTextField!
    @IBOutlet var email: NSTextField!
    
    var buttonTapped : (() -> ()) = {}
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    @IBAction func orderButtonPressed(_ sender: Any) {
        buttonTapped()
    }
}
