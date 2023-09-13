//
//  Left.swift
//  POS
//
//  Created by Malik Muhammad on 7/11/23.
//

import Cocoa

class GMView: NSViewController {

    @IBOutlet var headshot: NSButton!
    @IBOutlet var collectionView: NSCollectionView!
    
    @IBOutlet var overviewButton: NSButton!
    @IBOutlet var operationsButton: NSButton!
    @IBOutlet var accountingButton: NSButton!
    @IBOutlet var marketingButton: NSButton!
    @IBOutlet var fsStaffButton: NSButton!
    
    
    @IBOutlet var button1: NSButton!
    @IBOutlet var button2: NSButton!
    @IBOutlet var button3: NSButton!
    @IBOutlet var button4: NSButton!
    
    
    
    private var members : [Members] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if title == "Left" {
            
            headshot.wantsLayer = true
            headshot.layer?.borderWidth = 1
            headshot.layer?.masksToBounds = false
            headshot.layer?.borderColor = NSColor.white.cgColor
            headshot.layer?.cornerRadius = headshot.frame.height/2
            headshot.layer?.masksToBounds = true
            view.wantsLayer = true
            self.view.layer?.backgroundColor = NSColor.black.cgColor
            
            collectionView.register(NSNib(nibNamed: "MessageItem", bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MessageItem"))
            collectionView.delegate = self
            collectionView.dataSource = self
            setup()
        }
        
        // Do view setup here.
        
        
        
    }
    
    
    private func setup() {
        for i in 0..<10 {
            let x = Members(image: NSImage(named: "headshot1")!, text: "Malik Muhammad \(i)")
            members.append(x)
            collectionView.insertItems(at: [IndexPath(item: members.count - 1, section: 0)])
        }
    }
    
    @IBAction func overViewButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func operationsButtonPressed(_ sender: Any) {
        if title == "Right" {
            button1.stringValue = "Inventory"
            button2.stringValue = "Menu"
            button3.stringValue = "Staff"
            button4.stringValue = "Requests"
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }
        
    }
    
    @IBAction func accountingButtonPressed(_ sender: Any) {
        if title == "Right" {
            button1.stringValue = "Overview"
            button2.stringValue = "Expenses"
            button3.stringValue = "Revenue"
            button4.stringValue = "Projections"
        }
    }
    
    @IBAction func marketingButtonPressed(_ sender: Any) {
        if title == "Right" {
            button1.stringValue = "Sales"
            button2.stringValue = "Promotions"
            button3.stringValue = "Upcoming"
            button4.stringValue = "District"
        }
    }
    
    @IBAction func fsStaffButtonPressed(_ sender: Any) {
        if title == "Right" {
            button1.stringValue = "Menu"
            button2.stringValue = "Staff"
            button3.stringValue = "Issues"
            button4.isEnabled = false
            
        }
    }
    
    private func configureCollectionView(width: Double, height: Double) {
      // 1
      let flowLayout = NSCollectionViewFlowLayout()
      flowLayout.itemSize = NSSize(width: width, height: height)
      flowLayout.sectionInset = NSEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
      flowLayout.minimumInteritemSpacing = 0.0
      flowLayout.minimumLineSpacing = 0.0
      collectionView.collectionViewLayout = flowLayout
      // 2
      view.wantsLayer = true
      // 3
    }
}

extension GMView: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let members = members[indexPath.item]
        if indexPath.item == 0 {
            return NSSize(width: 180, height: 65)
        } else {
            return NSSize(width: 180, height: 37)
        }
    }
    
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MessageItem"), for: indexPath) as! MessageItem
        
       
        let data = members[indexPath.item]
        item.view.wantsLayer = true
        print("indexpath \(indexPath.item)")
        
        if indexPath.item == 0 {
            item.header.isHidden = false
            item.headerLine.isHidden = false
            item.imageConstraint.constant = 35
            item.labelConstraint.constant = 41
        } else {
            item.header.isHidden = true
            item.headerLine.isHidden = true
            item.imageConstraint.constant = 5
            item.labelConstraint.constant = 11
        }
        item.image1.image = data.image
        item.label.stringValue = data.text
        
        return item
        
    }
    
   

    
    
}
