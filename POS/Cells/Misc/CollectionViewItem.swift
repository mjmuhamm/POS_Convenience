//
//  CollectionViewItem.swift
//  POS
//
//  Created by Malik Muhammad on 7/9/23.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    @IBOutlet var label2: NSTextField!
    @IBOutlet var image1: NSImageView!
    
    @IBOutlet var selectImage: NSImageView!
    var buttonTapped : (() -> ()) = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        selectImage.alphaValue = 0.8
        view.wantsLayer = true
            view.layer?.backgroundColor = NSColor.white.cgColor
        label2.textColor = NSColor.black
        
    }
    
    @IBAction func thisButtonPressed(_ sender: Any) {
        buttonTapped()
        
    }
}
