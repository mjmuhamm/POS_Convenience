//
//  SecondView.swift
//  POS
//
//  Created by Malik Muhammad on 7/2/23.
//

import Cocoa

class SecondView: NSViewController {

    @IBOutlet var image1: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        image1.wantsLayer = true
        image1.layer?.borderWidth = 1
        image1.layer?.masksToBounds = false
        image1.layer?.borderColor = NSColor.white.cgColor
        image1.layer?.cornerRadius = image1.frame.height/2
        image1.layer?.masksToBounds = true
        view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor(deviceRed: 48/255, green: 48/255, blue: 48/255, alpha: 1).cgColor
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(true)
    }
    
}
