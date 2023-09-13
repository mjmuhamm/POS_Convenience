//
//  SchoolCollection.swift
//  POS
//
//  Created by Malik Muhammad on 7/15/23.
//

import Cocoa

class SchoolCollection: NSCollectionViewItem {

    @IBOutlet var label: NSTextField!
    @IBOutlet var button: NSButton!
    
    @IBOutlet weak var label1: NSTextField!
    
    var buttonTapped : (() -> ()) = {}
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        
        view.layer?.backgroundColor = NSColor.black.cgColor
        label.textColor = NSColor.white
        
     
        
    }
    
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        buttonTapped()
        
    }
}
