//
//  MessagesRight.swift
//  POS
//
//  Created by Malik Muhammad on 7/13/23.
//

import Cocoa

class MessagesRight: NSViewController {
   
    
    @IBOutlet var headshot: NSButton!
    @IBOutlet var individualName: NSTextField!
    
    @IBOutlet var tableView: NSTableView!
    
    @IBOutlet var sendMessageButton: NSButton!
    @IBOutlet var messageText: NSTextField!
    
    
    var messages : [Messages] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(deviceRed: 48/255, green: 48/255, blue: 48/255, alpha: 1).cgColor
        
        
        headshot.wantsLayer = true
        headshot.layer?.borderWidth = 1
        headshot.layer?.masksToBounds = false
        headshot.layer?.borderColor = NSColor.white.cgColor
        headshot.layer?.cornerRadius = headshot.frame.height/2
        headshot.layer?.masksToBounds = true
        
        
        let attrs = [NSAttributedString.Key.foregroundColor: NSColor.white,
                     NSAttributedString.Key.font: NSFont.systemFont(ofSize: 13)]
        let placeholderString = NSAttributedString(string: "Write message here..", attributes: attrs)
        (messageText.cell as? NSTextFieldCell)?.placeholderAttributedString = placeholderString
        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do view setup here.
        setup(name: "Malik Muhammad 0")
        
        
    }
    
    func setup(name: String) {
        individualName.stringValue = name
        var homeOrAway = "home"
        for i in 0..<30 {
            if i == 0 || i == 1 {
                if homeOrAway == "home" { homeOrAway = "away" } else { homeOrAway = "home" }
                messages.append(Messages(homeOrAway: homeOrAway, message: "This is a message \(i). This is a message \(i). This is a message \(i). This is a message \(i). This is a message \(i). This is a message \(i). This is a message \(i). This is a message \(i). This is a message \(i). This is a message \(i). This is a message \(i).", date: "10/\(i)/23 10:\(i+10) AM"))
                tableView.insertRows(at: IndexSet(integer: messages.count - 1), withAnimation: .effectFade)
          
            } else {
                if homeOrAway == "home" { homeOrAway = "away" } else { homeOrAway = "home" }
                messages.append(Messages(homeOrAway: homeOrAway, message: "This is a message \(i)", date: "10/\(i)/23 10:\(i+10) AM"))
                tableView.insertRows(at: IndexSet(integer: messages.count - 1), withAnimation: .effectFade)
            }
        }
    }
    
    @IBAction func messageButtonPressed(_ sender: Any) {
        
    }
    
}

extension MessagesRight : NSTableViewDelegate, NSTableViewDataSource {
    func tableView(_ tableView: NSTableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
        
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let item = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableCell"), owner: self) as! MessagesText
        
        
        let data = messages[row]        
        if data.homeOrAway == "away" {
            item.awayText.stringValue = data.message
            item.awayDate.stringValue = data.date
            item.homeStack.isHidden = true
            item.awayStack.isHidden = false
        } else {
            item.homeText.stringValue = data.message
            item.homeDate.stringValue = data.date
            item.homeStack.isHidden = false
            item.awayStack.isHidden = true
        }
        
        return item
        
    }
    
    

    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        let message = messages[row].message

        if message.count >= 104 && message.count < 225 {
            return CGFloat(55)
        } else if message.count >= 225 && message.count < 315 {
            return CGFloat(70)
        } else if message.count >= 315 && message.count < 419 {
            return CGFloat(85)
        } else if message.count >= 419 && message.count < 524 {
            return CGFloat(100)
        } else if message.count >= 524 && message.count < 624 {
            return CGFloat(124)
        } else if message.count >= 624 && message.count < 734 {
            return CGFloat(140)
        } else if message.count >= 734 && message.count < 839 {
            return CGFloat(159)
        } else if message.count >= 839 && message.count < 944 {
            return CGFloat(175)
        } else if message.count >= 944 && message.count < 1049 {
            return CGFloat(199)
        } else if message.count >= 1049 && message.count < 1154 {
            return CGFloat(215)
        } else if message.count >= 1154 && message.count < 1259 {
            return CGFloat(230)
        } else if message.count >= 1259 && message.count < 1364 {
            return CGFloat(245)
        } else if message.count >= 1364 && message.count < 1469 {
            return CGFloat(260)
        } else if message.count >= 1469 && message.count < 1564 {
            return CGFloat(275)
        } else if message.count >= 1564 && message.count < 1679 {
            return CGFloat(290)
        } else if message.count >= 1679 && message.count < 1784 {
            return CGFloat(305)
        } else if message.count >= 1784 && message.count < 1889 {
            return CGFloat(320)
        } else if message.count >= 1889 && message.count < 1994 {
            return CGFloat(335)
        } else if message.count >= 1994 {
            return CGFloat(350)
        }

        return CGFloat(45)
    }
        
    }
