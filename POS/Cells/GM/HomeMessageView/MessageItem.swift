//
//  MessageItem.swift
//  POS
//
//  Created by Malik Muhammad on 7/12/23.
//

import Cocoa

class MessageItem: NSCollectionViewItem {

    @IBOutlet var imageConstraint: NSLayoutConstraint!
    //5
    //35
    @IBOutlet var labelConstraint: NSLayoutConstraint!
    //11
    //41
    @IBOutlet var buttonConstraint: NSLayoutConstraint!
    //5
    //35
    
    @IBOutlet var notificationConstant: NSLayoutConstraint!
    //7
    //36
    
    @IBOutlet var label: NSTextField!
    @IBOutlet var image1: NSImageView!
    
    @IBOutlet var header: NSTextField!
    @IBOutlet var headerLine: NSTextField!
    
    @IBOutlet var itemButton: NSButton!
    
    @IBOutlet var notificationBell: NSImageView!
    
    
    var buttonTapped : (() -> ()) = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        image1.wantsLayer = true
        image1.layer?.borderWidth = 1
        image1.layer?.masksToBounds = false
        image1.layer?.borderColor = NSColor.white.cgColor
        image1.layer?.cornerRadius = image1.frame.height/2
        image1.layer?.masksToBounds = true
       
        
    }
    
    @IBAction func itemButtonPressed(_ sender: Any) {
        buttonTapped()
    }
}
