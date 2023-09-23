//
//  MessagesLeft.swift
//  POS
//
//  Created by Malik Muhammad on 7/13/23.
//

import Cocoa

class MessagesLeft: NSViewController {

    @IBOutlet var collectionView: NSCollectionView!
    private var members : [Members] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(deviceRed: 48/255, green: 48/255, blue: 48/255, alpha: 1).cgColor
        
        collectionView.register(NSNib(nibNamed: "MessageItem", bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MessageItem"))
        collectionView.delegate = self
        collectionView.dataSource = self
        setup()
    }
    
    private func setup() {
        for i in 0..<10 {
            let x = Members(image: NSImage(named: "headshot1")!, text: "Malik Muhammad \(i)")
            members.append(x)
            collectionView.insertItems(at: [IndexPath(item: members.count - 1, section: 0)])
        }
    }
    var x = 1
    
}

extension MessagesLeft: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let members = members[indexPath.item]
       
        if indexPath.item == 0 {
            return NSSize(width: 200, height: 70)
        } else if indexPath.item == 3 {
            return NSSize(width: 200, height: 70)
        } else if indexPath.item == 6 {
            return NSSize(width: 200, height: 70)
        } else {
            return NSSize(width: 200, height: 41)
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
        item.notificationBell.isHidden = true
        if indexPath.item == 0 {
            item.header.isHidden = false
            item.headerLine.isHidden = false
            item.imageConstraint.constant = 39
            item.labelConstraint.constant = 45
            item.buttonConstraint.constant = 39
            item.notificationConstant.constant = 30
        } else if indexPath.item == 3 {
            item.header.isHidden = false
            item.headerLine.isHidden = false
            item.header.stringValue = "Accounting"
            item.imageConstraint.constant = 39
            item.labelConstraint.constant = 45
            item.buttonConstraint.constant = 39
            item.notificationConstant.constant = 30
        } else if indexPath.item == 6 {
            item.header.isHidden = false
            item.headerLine.isHidden = false
            item.header.stringValue = "Marketing"
            item.imageConstraint.constant = 39
            item.labelConstraint.constant = 45
            item.buttonConstraint.constant = 39
            item.notificationConstant.constant = 30
        } else {
            item.header.isHidden = true
            item.headerLine.isHidden = true
            item.imageConstraint.constant = 9
            item.labelConstraint.constant = 16
            item.buttonConstraint.constant = 9
            item.notificationConstant.constant = 3
        }
        
        
        
        item.image1.image = data.image
        item.label.stringValue = data.text
        
        item.buttonTapped = {
            print("happening")
            
            let sc = self.parent as! NSSplitViewController
            let vc = self.parent?.children[1] as! MessagesRight
                
            vc.messages.removeAll()
            vc.tableView.reloadData()
            self.x += 1
            vc.setup(name: data.text)
                

                sc.removeSplitViewItem(sc.splitViewItems[1])
                sc.addSplitViewItem(NSSplitViewItem(viewController: vc))
        }
        
        return item
        
    }
    
}
    
