//
//  MessagesRight.swift
//  POS
//
//  Created by Malik Muhammad on 9/27/23.
//

import Cocoa

class MessagesRight: NSViewController {
    
    
    @IBOutlet var headshot: NSButton!
    @IBOutlet var tableView: NSTableView!
    
    @IBOutlet var messageText: NSTextField!
    @IBOutlet var messageButton: NSButton!
    
    @IBOutlet var receiverName: NSTextField!
    
    var messages : [Messages] = []
    
    let arrayOfMessages : [String] = ["Standing at 324 meters, the Eiffel Tower in Paris, France, was completed in 1889 as the centerpiece of the 1889 World's Fair. It was initially met with mixed reactions but has since become an iconic symbol of France and one of the most recognizable landmarks globally.", "Located off the coast of Queensland, Australia, the Great Barrier Reef is the world's largest coral reef system, stretching over 2,300 kilometers. It is home to a diverse range of marine life, including countless species of fish, coral, and sea turtles.", " Painted by Leonardo da Vinci in the 16th century, the Mona Lisa is one of the most famous artworks in the world. It is known for its enigmatic smile and is displayed at the Louvre Museum in Paris.", "Covering approximately 5.5 million square kilometers, the Amazon Rainforest is the largest tropical rainforest in the world. It's home to a staggering variety of plant and animal species and plays a crucial role in regulating the Earth's climate.", "These ancient Egyptian structures are among the most famous archaeological sites on Earth. The Great Pyramid of Giza, built for Pharaoh Khufu, is one of the Seven Wonders of the Ancient World.", "The ISS is a space station orbiting Earth, inhabited by astronauts from various countries. It serves as a laboratory for scientific research and international cooperation in space exploration.", "Located in Agra, India, the Taj Mahal is a magnificent white marble mausoleum built by Emperor Shah Jahan in memory of his beloved wife Mumtaz Mahal. It's considered one of the most beautiful buildings in the world.", "Leonardo da Vinci's notebooks are filled with sketches and ideas that span various fields, including anatomy, engineering, and art. His curiosity knew no bounds.", "The aurora borealis, or Northern Lights, is a natural light display in the Earth's sky, primarily seen in high-latitude regions near the Arctic and Antarctic. It's caused by interactions between solar wind and the Earth's magnetic field.", "Painted by Michelangelo between 1508 and 1512, the Sistine Chapel ceiling is a masterpiece of Renaissance art, featuring iconic scenes such as the Creation of Adam.", "Stretching over 21,000 kilometers, the Great Wall is a series of fortifications built to protect China from invasions. It's a UNESCO World Heritage site and an iconic symbol of China.", "The human genome, comprising all of a person's DNA, contains the instructions for building and maintaining an individual. It was sequenced in its entirety in 2003, opening up new possibilities for genetics research.", "Pizza, with its origins in Italy, has become a global favorite. Its history dates back to ancient civilizations, and today, there are countless variations of this beloved dish.", "Covering much of North Africa, the Sahara is the largest hot desert in the world, with vast sand dunes and a challenging environment.", "Coffee, brewed from roasted coffee beans, has a rich history dating back to the 9th century. It's now one of the world's most popular beverages.", "Named after Leonardo of Pisa (Fibonacci), this mathematical sequence begins with 0 and 1, with each subsequent number being the sum of the two preceding ones. It appears in various aspects of nature and art.", "The Maya were an ancient Mesoamerican civilization known for their advanced mathematics, calendar systems, and impressive pyramids, including those at Chichen Itza.", "Located in California, USA, the redwood forest is home to the tallest trees on Earth, some reaching heights of over 350 feet (107 meters).", "Scottish scientist Alexander Fleming discovered penicillin in 1928, marking a breakthrough in medicine with the development of the first widely used antibiotic."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        previewMessages()
        
        
        
        headshot.wantsLayer = true
        headshot.layer?.borderWidth = 1
        headshot.layer?.masksToBounds = false
        headshot.layer?.borderColor = NSColor.white.cgColor
        headshot.layer?.cornerRadius = headshot.frame.height/2
        headshot.layer?.masksToBounds = true
        
        
        
    }
    
  
    func previewMessages() {
        let randomInt4 = Int.random(in: 1..<10)
        
        if randomInt4 == 2 {
            var z = "No Messages Yet"
            var a = ""
            messages.append(Messages(homeOrAway: "home", message: z, date: a))
            tableView.insertRows(at: IndexSet(integer: 0), withAnimation: .effectFade)
            
        } else {
            var homeOrAway = "home"
            for i in 0..<29 {
                let randomInt1 = Int.random(in: 1..<19)
                var z = arrayOfMessages[randomInt1]
                var a = "10/\(i + 1)/2023"
                
                
                
                if homeOrAway == "home" {homeOrAway = "away" } else { homeOrAway = "home" }
                
                messages.append(Messages(homeOrAway: homeOrAway, message: z, date: a))
                tableView.insertRows(at: IndexSet(integer: i), withAnimation: .effectFade)
            }
            //
        }
    }
    
    @IBAction func messageButtonPressed(_ sender: Any) {
    }
    
    
}

extension MessagesRight: NSTableViewDelegate, NSTableViewDataSource {
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let item = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableCell"), owner: self) as! MessagesText
        
        
        let message = messages[row]
        if message.homeOrAway == "home" {
            item.homeStack.isHidden = false
            item.homeDate.isHidden = false
            item.homeText.isHidden = false
            item.awayStack.isHidden = true
            
            item.homeDate.stringValue = message.date
            item.homeText.stringValue = message.message
            
        } else {
            item.homeStack.isHidden = true
            item.awayStack.isHidden = false
            item.awayDate.isHidden = false
            item.awayText.isHidden = false
            
            
            item.awayDate.stringValue = message.date
            item.awayText.stringValue = message.message
            item.awayText.textColor = NSColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
            item.awayDate.textColor = NSColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        }
        
        
        return item
        
    }
    
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        let message = messages[row]
        if message.message.count < 134 {
            return CGFloat(50)
        } else if message.message.count > 133 && message.message.count < 266 {
            return CGFloat(65)
        } else if message.message.count > 266 && message.message.count < 399 {
            return CGFloat(95)
        } else if message.message.count > 399 && message.message.count < 534 {
            return CGFloat(110)
        } else if message.message.count > 534 && message.message.count < 667 {
            return CGFloat(130)
        } else if message.message.count > 667 && message.message.count < 800 {
            return CGFloat(150)
        } else if message.message.count > 800 && message.message.count < 931 {
            return CGFloat(170)
        } else if message.message.count > 931 && message.message.count < 1064 {
            return CGFloat(190)
        } else if message.message.count > 1064 && message.message.count < 1198 {
            return CGFloat(200)
        } else if message.message.count > 1198 && message.message.count < 1330 {
            return CGFloat(215)
        } else if message.message.count > 1330 && message.message.count < 1463 {
            return CGFloat(225)
        } else if message.message.count > 1463 && message.message.count < 1596 {
            return CGFloat(240)
        } else if message.message.count > 1596 && message.message.count < 1729 {
            return CGFloat(255)
        } else if message.message.count > 1729 && message.message.count < 1862 {
            return CGFloat(275)
        } else if message.message.count > 1862 && message.message.count < 1997 {
            return CGFloat(290)
        } else if message.message.count > 1997 && message.message.count < 2128 {
            return CGFloat(305)
        } else if message.message.count > 2128 && message.message.count < 2262 {
            return CGFloat(320)
        } else {
            return CGFloat(350)
        }
        
        
        
    }
}
