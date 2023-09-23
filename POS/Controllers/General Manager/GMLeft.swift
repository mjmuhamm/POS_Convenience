//
//  Left.swift
//  POS
//
//  Created by Malik Muhammad on 7/11/23.
//

import Cocoa

class GMLeft: NSViewController {
    
    @IBOutlet var headshot: NSButton!
    @IBOutlet var collectionView: NSCollectionView!
    
    @IBOutlet var overViewButton: NSButton!
    @IBOutlet var operationsButton: NSButton!
    @IBOutlet var accountingButton: NSButton!
    @IBOutlet var marketingButton: NSButton!
    
    private var members : [Members] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headshot.wantsLayer = true
        headshot.layer?.borderWidth = 1
        headshot.layer?.masksToBounds = false
        headshot.layer?.borderColor = NSColor.white.cgColor
        headshot.layer?.cornerRadius = headshot.frame.height/2
        headshot.layer?.masksToBounds = true
        
        
        view.wantsLayer = true
//        self.view.layer?.backgroundColor = NSColor.black.cgColor
        
        self.view.layer?.backgroundColor = NSColor(deviceRed: 48/255, green: 48/255, blue: 48/255, alpha: 1).cgColor
        collectionView.register(NSNib(nibNamed: "MessageItem", bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MessageItem"))
        collectionView.delegate = self
        collectionView.dataSource = self
        setup()
        
        headshot.focusRingType = .none
        
    }
    
    private func setup() {
        for i in 0..<10 {
            let x = Members(image: NSImage(named: "headshot1")!, text: "Malik Muhammad \(i)")
            members.append(x)
            collectionView.insertItems(at: [IndexPath(item: members.count - 1, section: 0)])
        }
    }
    
    
    @IBAction func headshotButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segue1", sender: self)
    }
    
    
    @IBAction func overViewButtonPressed(_ sender: Any) {
        overViewButton.bezelColor = NSColor.lightGray
        operationsButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        accountingButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        marketingButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
      
        let sc = self.parent as! NSSplitViewController
        let vc = parent?.children[1] as! GMRight
        
        vc.button1.title = "Quarter 1"
        vc.button2.title = "Quarter 2"
        vc.button3.title = "Quarter 3"
        vc.button4.title = "Quarter 4"
        
        sc.title = "Overview"
        
        vc.typeOfSchool.isHidden = true
        vc.collectionScrollView.isHidden = true
        vc.menuStack.isHidden = true
        vc.breakfastButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        
        vc.dayOfTheWeekStack.isHidden = true
        vc.dayOfTheWeekLabel.isHidden = true
        vc.monthlyScrollView.isHidden = true
        vc.monthlyMenuLabel.isHidden = true
        vc.button1.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        vc.button2.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        vc.button3.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        vc.button4.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        vc.todayButton.bezelColor = NSColor.lightGray
        for i in 0..<vc.schools.count {
            vc.collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
        }
        
        //Overview
        vc.overviewView.isHidden = false
        vc.todayButton.isHidden = false
        vc.todayToggle = "yes"
        
        vc.customView1Label.stringValue = "Today's Revenue"
        vc.customView2Label.stringValue = "Today's Breakfast Revenue"
        vc.customView3Label.stringValue = "Today's Lunch Revenue"
        vc.customView4Label.stringValue = "Today's Visitors"
        
        vc.customView1PercentageChange.textColor = NSColor.white
        vc.customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        vc.customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        vc.customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        
        vc.customView1.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
        vc.customView2.layer?.backgroundColor = NSColor.clear.cgColor
        vc.customView3.layer?.backgroundColor = NSColor.clear.cgColor
        vc.customView4.layer?.backgroundColor = NSColor.clear.cgColor
        
        
        vc.loadOverviewData()
        
        //Overview
        vc.todayButton.isHidden = false
        
        //Staff
        vc.staffView.isHidden = true
        vc.managerLabel.isHidden = true
        vc.managerImage.isHidden = true
        vc.managerName.isHidden = true
        vc.hoursThisWeekLabel.isHidden = true

        vc.hoursThisWeekHours.isHidden = true
        vc.lateThisWeekLabel.isHidden = true
        vc.lateThisWeekTimes.isHidden = true
        vc.lateThisMonthLabel.isHidden = true
        vc.lateThisMonthTimes.isHidden = true
        vc.managerMessageButton.isHidden = true
        vc.totalTimesLateByStaffLabel.isHidden = true
        vc.totalTimesLateByStaffTimes.isHidden = true
        
        //Inventory
        vc.inventoryView.isHidden = true
        vc.setupInventory()
        
        //Vendors
        vc.vendorView.isHidden = true
        
        //Accounting
        vc.accountingView.isHidden = true
        
        
        
        
        sc.removeSplitViewItem(sc.splitViewItems[1])
        sc.addSplitViewItem(NSSplitViewItem(viewController: vc))
        
    }
    
    
    @IBAction func operationsButtonPressed(_ sender: Any) {
        operationsButton.bezelColor = NSColor.lightGray
        overViewButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        accountingButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        marketingButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        
        
        let sc = self.parent as! NSSplitViewController
        let vc = parent?.children[1] as! GMRight
        
        vc.button1.title = "Inventory"
        vc.button2.title = "Menu"
        vc.button3.title = "Staff"
        vc.button4.title = "Vendors"
        vc.breakfastButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        sc.title = "Operations"
        vc.toggle = "Inventory"
        vc.setupInventory()
        
        vc.typeOfSchool.isHidden = true
        vc.menuStack.isHidden = true
        
        vc.dayOfTheWeekStack.isHidden = true
        vc.dayOfTheWeekLabel.isHidden = true
        vc.monthlyScrollView.isHidden = true
        vc.monthlyMenuLabel.isHidden = true
        vc.collectionScrollView.isHidden = false
        vc.button1.bezelColor = NSColor.lightGray
        vc.button2.bezelColor = NSColor.black
        vc.button3.bezelColor = NSColor.black
        vc.button4.bezelColor = NSColor.black
        vc.setupMenu()
        for i in 0..<vc.schools.count {
            vc.collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
        }
        
        //Overview
        vc.todayButton.isHidden = true
        
        //Staff
        vc.staffView.isHidden = true
        vc.managerLabel.isHidden = true
        vc.managerImage.isHidden = true
        vc.managerName.isHidden = true
        vc.hoursThisWeekLabel.isHidden = true

        vc.hoursThisWeekHours.isHidden = true
        vc.lateThisWeekLabel.isHidden = true
        vc.lateThisWeekTimes.isHidden = true
        vc.lateThisMonthLabel.isHidden = true
        vc.lateThisMonthTimes.isHidden = true
        vc.managerMessageButton.isHidden = true
        vc.totalTimesLateByStaffLabel.isHidden = true
        vc.totalTimesLateByStaffTimes.isHidden = true
        sc.removeSplitViewItem(sc.splitViewItems[1])
        sc.addSplitViewItem(NSSplitViewItem(viewController: vc))
        
        //Overview
        vc.overviewView.isHidden = true
        
        //Inventory
        vc.inventoryView.isHidden = true
        
        //Vendors
        vc.vendorView.isHidden = true
        
        //Accounting
        vc.accountingView.isHidden = true
        
        
        
        
//
//        // OR method two
//        var items = splitViewController.splitViewItems
//        items[1] = item
//        splitViewController.splitViewItems = items
      
           
        
    }
    
    @IBAction func accountingButtonPressed(_ sender: Any) {
        overViewButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        operationsButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        accountingButton.bezelColor = NSColor.lightGray
        marketingButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        
        
        let sc = self.parent as! NSSplitViewController
        let vc = parent?.children[1] as! GMRight
        
        vc.button1.title = "Projections"
        vc.button2.title = "Revenue"
        vc.button3.title = "Expenses"
        vc.button4.title = "Profit"
        vc.breakfastButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        sc.title = "Accounting"
        
        vc.typeOfSchool.isHidden = true
        vc.collectionScrollView.isHidden = true
        vc.menuStack.isHidden = true
        
        vc.dayOfTheWeekStack.isHidden = true
        vc.dayOfTheWeekLabel.isHidden = true
        vc.monthlyScrollView.isHidden = true
        vc.monthlyMenuLabel.isHidden = true
        vc.button1.bezelColor = NSColor.lightGray
        vc.button2.bezelColor = NSColor.black
        vc.button3.bezelColor = NSColor.black
        vc.button4.bezelColor = NSColor.black
        
        //Overview
        vc.todayButton.isHidden = true
        
        //Staff
        vc.staffView.isHidden = true
        vc.managerLabel.isHidden = true
        vc.managerImage.isHidden = true
        vc.managerName.isHidden = true
        vc.hoursThisWeekLabel.isHidden = true

        vc.hoursThisWeekHours.isHidden = true
        vc.lateThisWeekLabel.isHidden = true
        vc.lateThisWeekTimes.isHidden = true
        vc.lateThisMonthLabel.isHidden = true
        vc.lateThisMonthTimes.isHidden = true
        vc.managerMessageButton.isHidden = true
        vc.totalTimesLateByStaffLabel.isHidden = true
        
        vc.totalTimesLateByStaffTimes.isHidden = true
        
        //Overview
        vc.overviewView.isHidden = true
        
        //Inventory
        vc.inventoryView.isHidden = true
        
        //Vendors
        vc.vendorView.isHidden = true
        
        //Accounting
        vc.accountingView.isHidden = false
        
        vc.weekButton.bezelColor = NSColor.lightGray
        vc.monthButton.bezelColor = NSColor.black
        vc.sixMonthButton.bezelColor = NSColor.black
        
        
        vc.weekConstraint.constant = 132
        vc.revenueConstraint.constant = 134
        vc.expenseConstraint.constant = 134
        
        vc.secondMonthGroupStack.isHidden = true
        vc.secondMonthExpenseStack.isHidden = true
        vc.secondMonthRevenueStack.isHidden = true
        
        vc.fFirstMonth.stringValue = "Last Week"
        vc.fSecondMonth.stringValue = "This Week"
        vc.fThirdMonth.stringValue = "% Change"
        
        //Revenue
        vc.breakfast1.stringValue = "$8,748"
        vc.breakfast2.stringValue = "$9,240"
        vc.breakfastPercent.stringValue = "5.4%"
        vc.breakfastPercent.textColor = NSColor.systemGreen
        
        vc.lunch1.stringValue = "$13,122"
        vc.lunch2.stringValue = "$14,250"
        vc.lunchPercent.stringValue = "8%"
        vc.lunchPercent.textColor = NSColor.systemGreen
        
        vc.snacks1.stringValue = "$5,470"
        vc.snacks2.stringValue = "$4,540"
        vc.snacksPercent.stringValue = "17.1%"
        vc.snacksPercent.textColor = NSColor.systemRed
        
        vc.other1.stringValue = "$4,550"
        vc.other2.stringValue = "$6,500"
        vc.otherPercent.stringValue = "30%"
        vc.otherPercent.textColor = NSColor.systemGreen
        
        vc.totalRevenue1.stringValue = "$31,890"
        vc.totalRevenue2.stringValue = "$34,530"
        vc.totalRevenuePercent.stringValue = "7.7%"
        vc.totalRevenuePercent.textColor = NSColor.systemGreen
        
        vc.sTotalRevenue1.textColor = NSColor.systemGreen
        vc.sTotalRevenue2.textColor = NSColor.systemGreen
        vc.totalRevenue1.textColor = NSColor.systemGreen
        vc.totalRevenue2.textColor = NSColor.systemGreen
        vc.totalRevenuePercent.textColor = NSColor.systemGreen
        vc.sTotalRevenuePercent.textColor = NSColor.systemGreen
        
        //Expense
        vc.foodCost1.stringValue = "$3,500"
        vc.foodCost2.stringValue = "$4,200"
        vc.foodCostPercent.stringValue = "16.7%"
        vc.foodCostPercent.textColor = NSColor.systemGreen
        
        vc.laborCost1.stringValue = "$2,000"
        vc.laborCost2.stringValue = "$2,000"
        vc.laborCostPercent.stringValue = "0%"
        vc.laborCostPercent.textColor = NSColor.systemGreen
        
        vc.supplies1.stringValue = "$0"
        vc.supplies2.stringValue = "$0"
        vc.suppliesPercent.stringValue = "0%"
        vc.suppliesPercent.textColor = NSColor.systemGreen
        
        vc.equipment1.stringValue = "$0"
        vc.equipment2.stringValue = "$0"
        vc.equipmentPercent.stringValue = "0%"
        vc.equipmentPercent.textColor = NSColor.systemGreen
        
        vc.utilities1.stringValue = "$0"
        vc.utilities2.stringValue = "$0"
        vc.utilitiesPercent.stringValue = "0%"
        vc.utilitiesPercent.textColor = NSColor.systemGreen
        
        vc.marketing1.stringValue = "$0"
        vc.marketing2.stringValue = "$0"
        vc.marketingPercent.stringValue = "0%"
        vc.marketingPercent.textColor = NSColor.systemGreen
        
        vc.expenseOther1.stringValue  = "$0"
        vc.expenseOther2.stringValue = "$0"
        vc.expenseOtherPercent.stringValue = "0%"
        vc.expenseOtherPercent.textColor = NSColor.systemGreen
        
        vc.totalExpenses1.stringValue = "$5,500"
        vc.totalExpenses2.stringValue = "$6,200"
        vc.totalExpensesPercent.stringValue = "11.3%"

        vc.totalExpenses1.textColor = NSColor.systemRed
        vc.totalExpenses2.textColor = NSColor.systemRed
        vc.totalExpensesPercent.textColor = NSColor.systemRed
        
        vc.netIncome1.stringValue = "$26,390"
        vc.netIncome2.stringValue = "$28,330"
        vc.netIncomePercent.stringValue = "6.9%"
        
        vc.netIncome1.textColor = NSColor.systemGreen
        vc.netIncome2.textColor = NSColor.systemGreen
        vc.netIncomePercent.textColor = NSColor.systemGreen
        
        
        for i in 0..<vc.schools.count {
            vc.collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
        }
        
        sc.removeSplitViewItem(sc.splitViewItems[1])
        sc.addSplitViewItem(NSSplitViewItem(viewController: vc))
        
//        if title == "Right" {
            
//        }
    }
    
    @IBAction func marketingButtonPressed(_ sender: Any) {
        overViewButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        operationsButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        accountingButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        marketingButton.bezelColor = NSColor.lightGray
     
        let sc = self.parent as! NSSplitViewController
        let vc = parent?.children[1] as! GMRight
        
        //Overview
        vc.todayButton.isHidden = true
        
        vc.button1.title = "District"
        vc.button2.title = "Promotions"
        vc.button3.title = "Events"
        vc.button4.title = "Issues"
        vc.breakfastButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        sc.title = "Marketing"
        
        vc.typeOfSchool.isHidden = true
        vc.collectionScrollView.isHidden = true
        vc.menuStack.isHidden = true
        
        vc.dayOfTheWeekStack.isHidden = true
        vc.dayOfTheWeekLabel.isHidden = true
        vc.monthlyScrollView.isHidden = true
        vc.monthlyMenuLabel.isHidden = true
        vc.button1.bezelColor = NSColor.lightGray
        vc.button2.bezelColor = NSColor.black
        vc.button3.bezelColor = NSColor.black
        vc.button4.bezelColor = NSColor.black
        
        //Overview
        vc.overviewView.isHidden = true
        
        //Staff
        vc.staffView.isHidden = true
        vc.managerLabel.isHidden = true
        vc.managerImage.isHidden = true
        vc.managerName.isHidden = true
        vc.hoursThisWeekLabel.isHidden = true

        vc.hoursThisWeekHours.isHidden = true
        vc.lateThisWeekLabel.isHidden = true
        vc.lateThisWeekTimes.isHidden = true
        vc.lateThisMonthLabel.isHidden = true
        vc.lateThisMonthTimes.isHidden = true
        vc.managerMessageButton.isHidden = true
        vc.totalTimesLateByStaffLabel.isHidden = true
        vc.totalTimesLateByStaffTimes.isHidden = true
        
        //Inventory
        vc.inventoryView.isHidden = true
        
        //Vendors
        vc.vendorView.isHidden = true
        
        //Accounting
        vc.accountingView.isHidden = true
        
        
        for i in 0..<vc.schools.count {
            vc.collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
        }

        sc.removeSplitViewItem(sc.splitViewItems[1])
        sc.addSplitViewItem(NSSplitViewItem(viewController: vc))
            
           
        
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
    var individualName = ""

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        
    }
}

extension GMLeft: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    
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
        
        
        if indexPath.item == 0 {
            item.header.isHidden = false
            item.headerLine.isHidden = false
            item.notificationBell.isHidden = true
            item.imageConstraint.constant = 39
            item.labelConstraint.constant = 45
            item.buttonConstraint.constant = 39
            item.notificationConstant.constant = 30
        } else if indexPath.item == 3 {
            item.header.isHidden = false
            item.headerLine.isHidden = false
            item.notificationBell.isHidden = false
            item.header.stringValue = "Accounting"
            item.imageConstraint.constant = 39
            item.labelConstraint.constant = 45
            item.buttonConstraint.constant = 39
            item.notificationConstant.constant = 30
        } else if indexPath.item == 6 {
            item.header.isHidden = false
            item.headerLine.isHidden = false
            item.notificationBell.isHidden = true
            item.header.stringValue = "Marketing"
            item.imageConstraint.constant = 39
            item.labelConstraint.constant = 45
            item.buttonConstraint.constant = 39
            item.notificationConstant.constant = 30
        } else {
            item.header.isHidden = true
            item.headerLine.isHidden = true
            item.notificationBell.isHidden = true
            item.imageConstraint.constant = 9
            item.labelConstraint.constant = 16
            item.buttonConstraint.constant = 9
            item.notificationConstant.constant = 3
        }
        
        item.image1.image = data.image
        item.label.stringValue = data.text
        
        item.buttonTapped = {
            print("happening")
            self.individualName = data.text
            self.performSegue(withIdentifier: "mainToMessagesSegue", sender: self)
        }
        
        return item
        
    }
    
    
    
}
