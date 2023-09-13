//
//  ViewController.swift
//  POS
//
//  Created by Malik Muhammad on 7/2/23.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var image1: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        image1.wantsLayer = true
        image1.layer?.borderWidth = 1
        image1.layer?.masksToBounds = false
        image1.layer?.borderColor = NSColor.white.cgColor
        image1.layer?.cornerRadius = image1.frame.height/2
        image1.layer?.masksToBounds = true
        view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.brown.cgColor
        
    }
    
    
    @IBAction func button1Pressed(_ sender: Any) {
        
    }
    
    @IBAction func pictureButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "segue1", sender: self)
        
    }
    
    
    
}

