//
//  Right.swift
//  POS
//
//  Created by Malik Muhammad on 7/11/23.
//

import Cocoa
import Charts
import DGCharts

class GMRight: NSViewController, ChartViewDelegate {
            
        
    var word = ""
    
    
    @IBOutlet var button1: NSButton!
    @IBOutlet var button2: NSButton!
    @IBOutlet var button3: NSButton!
    @IBOutlet var button4: NSButton!
    
    
    //Menu
    @IBOutlet var collectionScrollView: NSScrollView!
    @IBOutlet var collectionView: NSCollectionView!
    
    @IBOutlet var menuStack: NSStackView!
    var schools : [Schools] = []
    
    @IBOutlet var menuView: NSView!
    @IBOutlet var typeOfSchool: NSTextField!
    @IBOutlet var breakfastButton: NSButton!
    @IBOutlet var lunchButton: NSButton!
    
    @IBOutlet var dayOfTheWeekLabel: NSTextField!
    @IBOutlet var dayOfTheWeekStack: NSStackView!
    
    @IBOutlet var monday1: NSTextField!
    @IBOutlet var monday2: NSTextField!
    @IBOutlet var monday3: NSTextField!
    @IBOutlet var monday4: NSTextField!
    
    @IBOutlet var tuesday1: NSTextField!
    @IBOutlet var tuesday2: NSTextField!
    @IBOutlet var tuesday3: NSTextField!
    @IBOutlet var tuesday4: NSTextField!
    
    @IBOutlet var wednesday1: NSTextField!
    @IBOutlet var wednesday2: NSTextField!
    @IBOutlet var wednesday3: NSTextField!
    @IBOutlet var wednesday4: NSTextField!
    
    @IBOutlet var thursday1: NSTextField!
    @IBOutlet var thursday2: NSTextField!
    @IBOutlet var thursday3: NSTextField!
    @IBOutlet var thursday4: NSTextField!
    
    @IBOutlet var friday1: NSTextField!
    @IBOutlet var friday2: NSTextField!
    @IBOutlet var friday3: NSTextField!
    @IBOutlet var friday4: NSTextField!
    
    
    @IBOutlet var monthlyMenuLabel: NSTextField!
    @IBOutlet var monthlyScrollView: NSScrollView!
    @IBOutlet var monthlyCollectionView: NSCollectionView!
    
    private var monthlyMenu : [String] = []
    
    //Staff
    @IBOutlet var staffView: NSView!
    @IBOutlet var managerLabel: NSTextField!
    @IBOutlet var managerImage: NSButton!
    @IBOutlet var managerName: NSTextField!
    @IBOutlet var hoursThisWeekLabel: NSTextField!
    
    @IBOutlet var hoursThisWeekHours: NSTextField!
    @IBOutlet var lateThisWeekLabel: NSTextField!
    @IBOutlet var lateThisWeekTimes: NSTextField!
    @IBOutlet var lateThisMonthLabel: NSTextField!
    @IBOutlet var lateThisMonthTimes: NSTextField!
    @IBOutlet var totalTimesLateByStaffLabel: NSTextField!
    @IBOutlet var totalTimesLateByStaffTimes: NSTextField!
    
    
    @IBOutlet var managerMessageButton: NSButton!
    
    @IBOutlet var staffLabel: NSTextField!
    @IBOutlet var staffScrollView: NSScrollView!
    @IBOutlet var staffTableView: NSTableView!
    
    private var staff : [String] = []
    
    //Overview
    @IBOutlet var overviewView: NSView!
    @IBOutlet var barView: BarChartView!
    @IBOutlet var pieView: PieChartView!
    @IBOutlet var lineView: LineChartView!
    
    
    @IBOutlet var customView1: NSView!
    @IBOutlet var customView2: NSView!
    @IBOutlet var customView3: NSView!
    @IBOutlet var customView4: NSView!
    
    @IBOutlet var customView1Label: NSTextField!
    @IBOutlet var customView2Label: NSTextField!
    @IBOutlet var customView3Label: NSTextField!
    @IBOutlet var customView4Label: NSTextField!
    
    @IBOutlet var customView1LabelNumber: NSTextField!
    @IBOutlet var customView2LabelNumber: NSTextField!
    @IBOutlet var customView3LabelNumber: NSTextField!
    @IBOutlet var customView4LabelNumber: NSTextField!
    
    @IBOutlet var lineViewTitleLabel: NSTextField!
    
    //Fields
    @IBOutlet var customView1PercentageChange: NSTextField!
    @IBOutlet var customView2PercentageChange: NSTextField!
    @IBOutlet var customView3PercentageChange: NSTextField!
    @IBOutlet var customView4PercentageChange: NSTextField!
    
    
    //Inventory
    @IBOutlet var inventoryView: NSView!
    @IBOutlet var inventoryScrollView: NSScrollView!
    @IBOutlet var inventoryTableView: NSTableView!
    
    private var inventoryList: [Inventory] = []
    
    var toggle = "Inventory"
    
    //Vendors
    @IBOutlet var vendorView: NSView!
    @IBOutlet var vendorScrollView: NSScrollView!
    @IBOutlet var vendorTableView: NSTableView!
    
    @IBOutlet var vendorLabel: NSTextField!
    @IBOutlet var orderLabel: NSTextField!
    @IBOutlet var contactLabel: NSTextField!
    
    //Accounting
    @IBOutlet var weekButton: NSButton!
    @IBOutlet var monthButton: NSButton!
    @IBOutlet var sixMonthButton: NSButton!
    
    @IBOutlet var accountingView: NSView!
    
    @IBOutlet var weekConstraint: NSLayoutConstraint!
    @IBOutlet var revenueConstraint: NSLayoutConstraint!
    @IBOutlet var expenseConstraint: NSLayoutConstraint!
    //134
    //55
    @IBOutlet var breakfast1: NSTextField!
    @IBOutlet var breakfast2: NSTextField!
    @IBOutlet var breakfastPercent: NSTextField!
    @IBOutlet var lunch1: NSTextField!
    @IBOutlet var lunch2: NSTextField!
    @IBOutlet var lunchPercent: NSTextField!
    @IBOutlet var snacks1: NSTextField!
    @IBOutlet var snacks2: NSTextField!
    @IBOutlet var snacksPercent: NSTextField!
    @IBOutlet var other1: NSTextField!
    @IBOutlet var other2: NSTextField!
    @IBOutlet var otherPercent: NSTextField!
    @IBOutlet var totalRevenue1: NSTextField!
    @IBOutlet var totalRevenue2: NSTextField!
    @IBOutlet var totalRevenuePercent: NSTextField!
    
    @IBOutlet var foodCost1: NSTextField!
    @IBOutlet var foodCost2: NSTextField!
    @IBOutlet var foodCostPercent: NSTextField!
    @IBOutlet var laborCost1: NSTextField!
    @IBOutlet var laborCost2: NSTextField!
    @IBOutlet var laborCostPercent: NSTextField!
    @IBOutlet var supplies1: NSTextField!
    @IBOutlet var supplies2: NSTextField!
    @IBOutlet var suppliesPercent: NSTextField!
    @IBOutlet var equipment1: NSTextField!
    @IBOutlet var equipment2: NSTextField!
    @IBOutlet var equipmentPercent: NSTextField!
    @IBOutlet var utilities1: NSTextField!
    @IBOutlet var utilities2: NSTextField!
    @IBOutlet var utilitiesPercent: NSTextField!
    @IBOutlet var marketing1: NSTextField!
    @IBOutlet var marketing2: NSTextField!
    @IBOutlet var marketingPercent: NSTextField!
    @IBOutlet var expenseOther1: NSTextField!
    @IBOutlet var expenseOther2: NSTextField!
    @IBOutlet var expenseOtherPercent: NSTextField!
    
    @IBOutlet var totalExpenses1: NSTextField!
    @IBOutlet var totalExpenses2: NSTextField!
    @IBOutlet var totalExpensesPercent: NSTextField!
    
    @IBOutlet var netIncome1: NSTextField!
    @IBOutlet var netIncome2: NSTextField!
    @IBOutlet var netIncomePercent: NSTextField!
    
    
    @IBOutlet var firstMonthGroupStack: NSStackView!
    @IBOutlet var fFirstMonth: NSTextField!
    @IBOutlet var fSecondMonth: NSTextField!
    @IBOutlet var fThirdMonth: NSTextField!
    
    @IBOutlet var secondMonthGroupStack: NSStackView!
    @IBOutlet var sFirstMonth: NSTextField!
    @IBOutlet var sSecondMonth: NSTextField!
    @IBOutlet var sThirdMonth: NSTextField!
    
    @IBOutlet var secondMonthRevenueStack: NSStackView!
    @IBOutlet var secondMonthExpenseStack: NSStackView!
    
    
    @IBOutlet var sBreakfast1: NSTextField!
    @IBOutlet var sBreakfast2: NSTextField!
    @IBOutlet var sBreakfastPercent: NSTextField!
    @IBOutlet var sLunch1: NSTextField!
    @IBOutlet var sLunch2: NSTextField!
    @IBOutlet var sLunchPercent: NSTextField!
    @IBOutlet var sSnacks1: NSTextField!
    @IBOutlet var sSnacks2: NSTextField!
    @IBOutlet var sSnacksPercent: NSTextField!
    @IBOutlet var sOther1: NSTextField!
    @IBOutlet var sOther2: NSTextField!
    @IBOutlet var sOtherPercent: NSTextField!
    @IBOutlet var sTotalRevenue1: NSTextField!
    @IBOutlet var sTotalRevenue2: NSTextField!
    @IBOutlet var sTotalRevenuePercent: NSTextField!
    
    @IBOutlet var sFoodCost1: NSTextField!
    @IBOutlet var sFoodCost2: NSTextField!
    @IBOutlet var sFoodCostPercent: NSTextField!
    @IBOutlet var sLaborCost1: NSTextField!
    @IBOutlet var sLaborCost2: NSTextField!
    @IBOutlet var sLaborCostPercent: NSTextField!
    @IBOutlet var sSupplies1: NSTextField!
    @IBOutlet var sSupplies2: NSTextField!
    @IBOutlet var sSuppliesPercent: NSTextField!
    @IBOutlet var sEquipment1: NSTextField!
    @IBOutlet var sEquipment2: NSTextField!
    @IBOutlet var sEquipmentPercent: NSTextField!
    @IBOutlet var sUtilities1: NSTextField!
    @IBOutlet var sUtilities2: NSTextField!
    @IBOutlet var sUtilitiesPercent: NSTextField!
    @IBOutlet var sMarketing1: NSTextField!
    @IBOutlet var sMarketing2: NSTextField!
    @IBOutlet var sMarketingPercent: NSTextField!
    @IBOutlet var sExpenseOther1: NSTextField!
    @IBOutlet var sExpenseOther2: NSTextField!
    @IBOutlet var sExpenseOtherPercent: NSTextField!
    
    @IBOutlet var sTotalExpenses1: NSTextField!
    @IBOutlet var sTotalExpenses2: NSTextField!
    @IBOutlet var sTotalExpensesPercent: NSTextField!
    
    @IBOutlet var sNetIncome1: NSTextField!
    @IBOutlet var sNetIncome2: NSTextField!
    @IBOutlet var sNetIncomePercent: NSTextField!
    
    
    @IBOutlet var todayButton: NSButton!
    
    private var vendors: [Vendors] = []
    
    var todayToggle = "yes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor(deviceRed: 48/255, green: 48/255, blue: 48/255, alpha: 1).cgColor
        
        customView1.wantsLayer = true
        customView2.wantsLayer = true
        customView3.wantsLayer = true
        customView4.wantsLayer = true
        
        customView1.layer?.borderColor = NSColor(calibratedRed: 236/255, green: 236/255, blue: 236/255, alpha: 1).cgColor
        customView1.layer?.borderWidth = 0.23
        
        customView2.layer?.borderColor = NSColor(calibratedRed: 236/255, green: 236/255, blue: 236/255, alpha: 1).cgColor
        customView2.layer?.borderWidth = 0.23
        
        customView3.layer?.borderColor = NSColor(calibratedRed: 236/255, green: 236/255, blue: 236/255, alpha: 1).cgColor
        customView3.layer?.borderWidth = 0.23
        
        customView4.layer?.borderColor = NSColor(calibratedRed: 236/255, green: 236/255, blue: 236/255, alpha: 1).cgColor
        customView4.layer?.borderWidth = 0.23
        
       
        
        customView1Label.stringValue = "Today's Revenue"
        customView2Label.stringValue = "Today's Breakfast Revenue"
        customView3Label.stringValue = "Today's Lunch Revenue"
        customView4Label.stringValue = "Today's Visitors"
        lineViewTitleLabel.stringValue = "Today's Revenue"
        
        customView1PercentageChange.textColor = NSColor.white
        customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        
        customView1.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
        customView2.layer?.backgroundColor = NSColor.clear.cgColor
        customView3.layer?.backgroundColor = NSColor.clear.cgColor
        customView4.layer?.backgroundColor = NSColor.clear.cgColor
        
        
        
        //Start
        self.menuView.isHidden = true
        self.dayOfTheWeekStack.isHidden = true
        self.menuStack.isHidden = true
        self.dayOfTheWeekLabel.isHidden = true
        self.monthlyScrollView.isHidden = true
        self.monthlyMenuLabel.isHidden = true
        self.staffView.isHidden = true
        self.inventoryView.isHidden = false
        self.collectionScrollView.isHidden = true
        self.typeOfSchool.isHidden = true
        self.vendorView.isHidden = true
        
        
        
        collectionView.register(NSNib(nibNamed: "SchoolCollection", bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SchoolCollection"))
        collectionView.delegate = self
        collectionView.dataSource = self
        
        button1.wantsLayer = true
        button2.wantsLayer = true
        button3.wantsLayer = true
        button4.wantsLayer = true
        todayButton.bezelColor = NSColor.lightGray
        self.typeOfSchool.textColor = NSColor.black
        
        monthlyCollectionView.register(NSNib(nibNamed: "MonthlyMenu", bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MonthlyMenu"))
        monthlyCollectionView.delegate = self
        monthlyCollectionView.dataSource = self
        
        //Staff
        staffTableView.delegate = self
        staffTableView.dataSource = self
        
        managerImage.wantsLayer = true
        managerImage.layer?.borderWidth = 1
        managerImage.layer?.masksToBounds = false
        managerImage.layer?.borderColor = NSColor.white.cgColor
        managerImage.layer?.cornerRadius = managerImage.frame.height/2
        managerImage.layer?.masksToBounds = true
        
        //Overview
        self.overviewView.isHidden = false
        loadOverviewData()
        
        lineView.delegate = self
        pieView.delegate = self
        barView.delegate = self
        
        //Inventory
        self.inventoryView.isHidden = true
        inventoryTableView.delegate = self
        inventoryTableView.dataSource = self
        
        //Vendor
        vendorTableView.delegate = self
        vendorTableView.dataSource = self
        
        //Accounting
        accountingView.isHidden = true
        
    }
    
    
    
    func setupInventory() {
        if !inventoryList.isEmpty {
            inventoryList.removeAll()
            inventoryTableView.reloadData()
        }
        var a = "String Beans"
        var b = "30"
        for i in 0..<20 {
            if a == "String Beans" {
                a = "Chicken Strips"
                b = "30"
            } else {
                a = "String Beans"
                b = "25"
            }
            inventoryList.append(Inventory(product: a, quantity: b))
            inventoryTableView.insertRows(at: IndexSet(integer: i), withAnimation: .effectFade)
        }
    }
    
  
    func setupMenu() {
        if !schools.isEmpty {
            schools.removeAll()
            collectionView.animator().reloadData()
        }
        schools.append(Schools(typeOfSchool: "Elementary", school: "Bethune"))
        schools.append(Schools(typeOfSchool: "Elementary", school: "Banneker @ Marquette"))
        schools.append(Schools(typeOfSchool: "Elementary", school: "Beveridge"))
        schools.append(Schools(typeOfSchool: "Elementary", school: "Glen Park Academy"))
        schools.append(Schools(typeOfSchool: "Elementary", school: "McCullough Academy"))
        schools.append(Schools(typeOfSchool: "Elementary", school: "Williams Elementary"))
        schools.append(Schools(typeOfSchool: "Middle School", school: "Bailly STEM Academy"))
        schools.append(Schools(typeOfSchool: "Middle School", school: "Gary Middle VPA"))
        schools.append(Schools(typeOfSchool: "High School", school: "West Side Leadership Academy"))
        schools.append(Schools(typeOfSchool: "High School", school: "Gary Area Career Center"))
        collectionView.animator().reloadData()
        
        
    }
    
    func setupMonthlyMenu() {
        if !monthlyMenu.isEmpty {
            self.monthlyMenu.removeAll()
            self.monthlyCollectionView.reloadData()
        }
        
        for i in 0..<31 {
            monthlyMenu.append("\(i)")
            monthlyCollectionView.animator().reloadData()
            
        }
    }
    
    
    // ----------- Vendors ------------ //
    public func loadVendors() {
        vendors.append(Vendors(vendor: "Sysco", email: "info@sysco.com", phone: "1 (847) 669-5400"))
        vendors.append(Vendors(vendor: "Gordon Food Service", email: "info@gordanfoods.com", phone: "1 (800) 968-4164"))
        vendors.append(Vendors(vendor: "US Foods", email: "info@usfoods.com", phone: "1 (888) 648-2580"))
        vendors.append(Vendors(vendor: "Performance Food Group", email: "info@performfoods.com", phone: "1 (800) 777-2551"))
        vendors.append(Vendors(vendor: "Reinhart Food Service", email: "info@reinhartfoods.com", phone: "1 (630) 896-1991"))
        vendors.append(Vendors(vendor: "Shamrock Foods", email: "info@shamrockfoods.com", phone: "1 (602) 477-6464"))
        vendors.append(Vendors(vendor: "Nicholas & Company", email: "info@nicholasfoods.com", phone: "1 (800) 544-6547"))
        vendors.append(Vendors(vendor: "Martin Bros. Distributing", email: "info@martinfoods.com", phone: "1 (319) 266-1775"))
        vendors.append(Vendors(vendor: "Chef's Warehouse", email: "info@chefswarehouse.com", phone: "1 (888) 333-0318"))
        vendors.append(Vendors(vendor: "Hanson Faso Sales & Marketing", email: "info@hansonfoods.com", phone: "1 (630) 953-9800"))
        
        print("vendor count \(vendors.count)")
        vendorTableView.reloadData()
        
        
    }
    
    
    // ----------- Overview ----------- //
    public func loadOverviewData() {
        loadBarChart()
        loadLineChart()
        loadPieChart()
    }
    
    public func loadBarChart() {
        var weeklyData : [BarChartDataEntry] = [BarChartDataEntry(x: 0, y: 10), BarChartDataEntry(x: 1, y: 20), BarChartDataEntry(x: 2, y: 30), BarChartDataEntry(x: 3, y: 40), BarChartDataEntry(x: 3, y: 15), BarChartDataEntry(x: 3, y: 50)]
        let labels = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6"]
        
        
        
        
        self.barView.data?.notifyDataChanged()
        
        let set = BarChartDataSet(entries: weeklyData)
        set.colors = ChartColorTemplates.pastel()
       
        let data = BarChartData(dataSet: set)
        self.barView.data = data
        self.barView.xAxis.granularityEnabled = true
        self.barView.xAxis.drawGridLinesEnabled = false
        
        //            customVie.xAxis.drawAxisLineEnabled = true
        self.barView.leftAxis.drawAxisLineEnabled = false
        self.barView.rightAxis.drawGridLinesEnabled = false
        self.barView.xAxis.drawAxisLineEnabled = true
        self.barView.rightAxis.drawAxisLineEnabled = true
        self.barView.leftAxis.drawGridLinesEnabled = false
        self.barView.xAxis.axisMinimum = 0.2
        self.barView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        self.barView.xAxis.labelCount = labels.count
        self.barView.xAxis.centerAxisLabelsEnabled = true
        
        let groupSpace = 0.1
        let barSpace = 0.05
        let barWidth = 0.25
        
        let gg = data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        //                customVie.xAxis.axisMaximum = Double(0) + gg * 6
        self.barView.xAxis.axisMaximum = 6
        self.barView.xAxis.axisMinimum = 0
        data.groupBars(fromX:0, groupSpace: groupSpace, barSpace: barSpace)
        self.barView.xAxis.labelCount = labels.count
        self.barView.xAxis.centerAxisLabelsEnabled = true
        data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        
        self.barView.leftAxis.drawLabelsEnabled = false
        self.barView.xAxis.labelTextColor = NSColor.white
        self.barView.rightAxis.labelTextColor = NSColor.white
        self.barView.data?.setValueTextColor(NSColor.white)
        
        self.barView.xAxis.granularityEnabled = true
        //            customVie.xAxis.spaceMin = 0.3
        self.barView.xAxis.labelWidth = 1
        self.barView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuart)
    }
    
    public func loadLineChart() {
        var data1 = LineChartData()
        var weeklyData = [ChartDataEntry]()
        
        var a = [ChartDataEntry(x: 0, y: 10), ChartDataEntry(x: 1, y: 20), ChartDataEntry(x: 2, y: 30), ChartDataEntry(x: 3, y: 40), ChartDataEntry(x: 4, y: 20), ChartDataEntry(x: 5, y: 80), ChartDataEntry(x: 6, y: 10), ChartDataEntry(x: 7, y: 25)]
        
        var b = [ChartDataEntry(x: 0, y: 60), ChartDataEntry(x: 1, y: 95), ChartDataEntry(x: 2, y: 115), ChartDataEntry(x: 3, y: 85), ChartDataEntry(x: 4, y: 107), ChartDataEntry(x: 5, y: 130), ChartDataEntry(x: 6, y: 139), ChartDataEntry(x: 7, y: 105)]
        
        let labels = ["Week 1", "Week 2", "Week 3", "Week 4"]
        
        
        
        
        self.barView.data?.notifyDataChanged()
        
        let set = LineChartDataSet(entries: a)
        set.drawFilledEnabled = true
        set.fillColor = NSColor.white
        set.mode = .cubicBezier
        let set1 = LineChartDataSet(entries: b)
        set1.mode = .cubicBezier
        
        data1.dataSets.append(set)
        data1.dataSets.append(set1)
        
        
        set.colors = ChartColorTemplates.pastel()
//        let data = LineChartData(dataSet: data1)
        self.lineView.data = data1
        self.lineView.xAxis.granularityEnabled = true
        self.lineView.xAxis.drawGridLinesEnabled = false
        //            customVie.xAxis.drawAxisLineEnabled = true
        self.lineView.leftAxis.drawAxisLineEnabled = false
        self.lineView.rightAxis.drawGridLinesEnabled = false
        self.lineView.xAxis.drawAxisLineEnabled = true
        self.lineView.leftAxis.drawAxisLineEnabled = true
        self.lineView.leftAxis.drawLabelsEnabled = false
        self.lineView.rightAxis.drawAxisLineEnabled = true
        self.lineView.leftAxis.drawGridLinesEnabled = false
        self.lineView.xAxis.axisMinimum = 0.2
        self.lineView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        self.lineView.xAxis.labelCount = labels.count
        self.lineView.xAxis.labelTextColor = NSColor.white
        self.lineView.rightAxis.labelTextColor = NSColor.white
        self.lineView.data?.setValueTextColor(NSColor.white)
                   
        
        self.lineView.xAxis.labelCount = labels.count
       
        self.lineView.xAxis.granularityEnabled = true
        //            customVie.xAxis.spaceMin = 0.3
        self.lineView.xAxis.labelWidth = 1
        self.lineView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInOutQuart)
    }
    
    
    private func loadPieChart() {
        
        var pieChartData : [PieChartDataEntry] = []
        self.pieView.clearValues()
        self.pieView.clear()
        
        
        var array1 = [".", ".", ".", ".", "."]
        var x = 25
        for i in 0..<array1.count {
            x += 25
            pieChartData.append(PieChartDataEntry(value: Double(x), label: ""))
            
            let set = PieChartDataSet(entries: pieChartData)
            set.colors = ChartColorTemplates.pastel()
            self.pieView.entryLabelColor = .clear
            self.pieView.holeColor = NSColor(deviceRed: 48/255, green: 48/255, blue: 48/255, alpha: 1)
            set.entryLabelFont = .systemFont(ofSize: 11)
            let data = PieChartData(dataSet: set)
            self.pieView.data = data
            self.pieView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuart)
        }
    }
    
    // ---------------------------- //
    
    
    @IBAction func button1Pressed(_ sender: Any) {
        todayToggle = "no"
        button1.bezelColor = NSColor.lightGray
        button2.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button3.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button4.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        breakfastButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        todayButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
       
        if button1.title == "Inventory" {
            collectionScrollView.isHidden = false
            toggle = "Inventory"
        } else if button1.title == "Quarter 1" {
            
            customView1PercentageChange.textColor = NSColor.white
            customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            
            customView1.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
            customView2.layer?.backgroundColor = NSColor.clear.cgColor
            customView3.layer?.backgroundColor = NSColor.clear.cgColor
            customView4.layer?.backgroundColor = NSColor.clear.cgColor
            loadOverviewData()
            
            lineViewTitleLabel.stringValue = "Average Daily Revenue"
            customView1Label.stringValue = "Average Daily Revenue"
            customView2Label.stringValue = "Average Breakfast Revenue"
            customView3Label.stringValue = "Average Lunch Revenue"
            customView4Label.stringValue = "Average Daily Visitors"
        }
        menuStack.isHidden = true
        
        typeOfSchool.isHidden = true
        dayOfTheWeekStack.isHidden = true
        dayOfTheWeekLabel.isHidden = true
        monthlyScrollView.isHidden = true
        monthlyMenuLabel.isHidden = true
        menuView.isHidden = true
        setupMenu()
        
        
        //Staff
        staffView.isHidden = true
        managerLabel.isHidden = true
        managerImage.isHidden = true
        managerName.isHidden = true
        hoursThisWeekLabel.isHidden = true

        hoursThisWeekHours.isHidden = true
        lateThisWeekLabel.isHidden = true
        lateThisWeekTimes.isHidden = true
        lateThisMonthLabel.isHidden = true
        lateThisMonthTimes.isHidden = true
        managerMessageButton.isHidden = true

        staffLabel.isHidden = true
        staffScrollView.isHidden = true
        totalTimesLateByStaffLabel.isHidden = true
        totalTimesLateByStaffTimes.isHidden = true
        
        //Vendors
        self.vendorView.isHidden = true
        
        for i in 0..<self.schools.count {
                collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
        }
    }
    
    
    @IBAction func button2Pressed(_ sender: Any) {
        todayToggle = "no"
        button1.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button2.bezelColor = NSColor.lightGray
        button3.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button4.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        breakfastButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        todayButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        
        
        if button2.title == "Menu" {
            toggle = "Menu"
           
            menuStack.isHidden = false
            collectionScrollView.isHidden = false
            monthlyMenuLabel.isHidden = true
            
            monthlyScrollView.isHidden = true
            monthlyMenuLabel.isHidden = true
            menuStack.isHidden = true
            menuView.isHidden = false
            
            setupMenu()
            
            //Staff
            staffView.isHidden = true
            managerLabel.isHidden = true
            managerImage.isHidden = true
            managerName.isHidden = true
            hoursThisWeekLabel.isHidden = true
    
            hoursThisWeekHours.isHidden = true
            lateThisWeekLabel.isHidden = true
            lateThisWeekTimes.isHidden = true
            lateThisMonthLabel.isHidden = true
            lateThisMonthTimes.isHidden = true
            managerMessageButton.isHidden = true
    
            staffLabel.isHidden = true
            staffScrollView.isHidden = true
            totalTimesLateByStaffLabel.isHidden = true
            totalTimesLateByStaffTimes.isHidden = true
                
            //Inventory
            inventoryView.isHidden = true
            
            //Vendors
            self.vendorView.isHidden = true
            
            
            for i in 0..<self.schools.count {
                    collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
            }
        } else if button2.title == "Quarter 2" {
            loadOverviewData()
            
            customView1PercentageChange.textColor = NSColor.white
            customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            
            customView1.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
            customView2.layer?.backgroundColor = NSColor.clear.cgColor
            customView3.layer?.backgroundColor = NSColor.clear.cgColor
            customView4.layer?.backgroundColor = NSColor.clear.cgColor
            loadOverviewData()
            
            lineViewTitleLabel.stringValue = "Average Daily Revenue"
            customView1Label.stringValue = "Average Daily Revenue"
            customView2Label.stringValue = "Average Breakfast Revenue"
            customView3Label.stringValue = "Average Lunch Revenue"
            customView4Label.stringValue = "Average Daily Visitors"
            
        }
        
    }
    
    @IBAction func button3Pressed(_ sender: Any) {
        todayToggle = "no"
        button1.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button2.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button3.bezelColor = NSColor.lightGray
        button4.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        breakfastButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        todayButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        
        if button3.title == "Staff" {
            toggle = "Staff"
            staffView.isHidden = false
            collectionScrollView.isHidden = false
        } else if button3.title == "Quarter 3" {
            loadOverviewData()
            
            customView1PercentageChange.textColor = NSColor.white
            customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            
            customView1.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
            customView2.layer?.backgroundColor = NSColor.clear.cgColor
            customView3.layer?.backgroundColor = NSColor.clear.cgColor
            customView4.layer?.backgroundColor = NSColor.clear.cgColor
            loadOverviewData()
            
            lineViewTitleLabel.stringValue = "Average Daily Revenue"
            customView1Label.stringValue = "Average Daily Revenue"
            customView2Label.stringValue = "Average Breakfast Revenue"
            customView3Label.stringValue = "Average Lunch Revenue"
            customView4Label.stringValue = "Average Daily Visitors"
        }
        menuStack.isHidden = true
        staffLabel.isHidden = true
        typeOfSchool.isHidden = true
        dayOfTheWeekStack.isHidden = true
        dayOfTheWeekLabel.isHidden = true
        monthlyScrollView.isHidden = true
        monthlyMenuLabel.isHidden = true
        menuView.isHidden = true
        staffScrollView.isHidden = true
        totalTimesLateByStaffLabel.isHidden = true
        totalTimesLateByStaffTimes.isHidden = true
            
        //Inventory
        inventoryView.isHidden = true
        
        //Vendors
        self.vendorView.isHidden = true
        
            
         for i in 0..<self.schools.count {
            collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
        }
            
        
        
        
    }
    
    @IBAction func button4Pressed(_ sender: Any) {
        todayToggle = "no"
        button1.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button2.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button3.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        breakfastButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button4.bezelColor = NSColor.lightGray
        todayButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        
        if button4.title == "Vendors" {
            toggle = "Vendors"
            
            menuStack.isHidden = true
            collectionScrollView.isHidden = true
            typeOfSchool.isHidden = true
            dayOfTheWeekStack.isHidden = true
            dayOfTheWeekLabel.isHidden = true
            monthlyScrollView.isHidden = true
            monthlyMenuLabel.isHidden = true
            menuView.isHidden = true
            
            //Staff
            staffView.isHidden = true
            managerLabel.isHidden = true
            managerImage.isHidden = true
            managerName.isHidden = true
            hoursThisWeekLabel.isHidden = true

            hoursThisWeekHours.isHidden = true
            lateThisWeekLabel.isHidden = true
            lateThisWeekTimes.isHidden = true
            lateThisMonthLabel.isHidden = true
            lateThisMonthTimes.isHidden = true
            managerMessageButton.isHidden = true

            staffLabel.isHidden = true
            staffScrollView.isHidden = true
            totalTimesLateByStaffLabel.isHidden = true
            totalTimesLateByStaffTimes.isHidden = true
            
            //Inventory
            inventoryView.isHidden = true
            
            
            //Vendors
            self.vendorView.isHidden = false
            loadVendors()
            
            for i in 0..<self.schools.count {
                    collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
            }
        } else if button4.title == "Quarter 4" {
            loadOverviewData()
            
            customView1PercentageChange.textColor = NSColor.white
            customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
            
            customView1.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
            customView2.layer?.backgroundColor = NSColor.clear.cgColor
            customView3.layer?.backgroundColor = NSColor.clear.cgColor
            customView4.layer?.backgroundColor = NSColor.clear.cgColor
            
            loadOverviewData()
            
            lineViewTitleLabel.stringValue = "Average Daily Revenue"
            customView1Label.stringValue = "Average Daily Revenue"
            customView2Label.stringValue = "Average Breakfast Revenue"
            customView3Label.stringValue = "Average Lunch Revenue"
            customView4Label.stringValue = "Average Daily Visitors"
        }
        
        
        
       
    }
    
    @IBAction func todayButtonPressed(_ sender: Any) {
        todayToggle = "yes"
        button1.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button2.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button3.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        button4.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        breakfastButton.bezelColor = NSColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        todayButton.bezelColor = NSColor.lightGray
        
        lineViewTitleLabel.stringValue = "Today's Revenue"
        loadLineChart()
        
        customView1Label.stringValue = "Today's Revenue"
        customView2Label.stringValue = "Today's Breakfast Revenue"
        customView3Label.stringValue = "Today's Lunch Revenue"
        customView4Label.stringValue = "Today's Visitors"
        
        customView1PercentageChange.textColor = NSColor.white
        customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        
        customView1.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
        customView2.layer?.backgroundColor = NSColor.clear.cgColor
        customView3.layer?.backgroundColor = NSColor.clear.cgColor
        customView4.layer?.backgroundColor = NSColor.clear.cgColor
    }
    
    
    
    // -- Overview -- //
    @IBAction func customView1ButtonPressed(_ sender: Any) {
        if todayToggle != "yes" {
            lineViewTitleLabel.stringValue = "Average Daily Revenue"
        } else {
            lineViewTitleLabel.stringValue = "Today's Revenue"
        }
        loadLineChart()
        
        
        customView1PercentageChange.textColor = NSColor.white
        customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        
        customView1.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
        customView2.layer?.backgroundColor = NSColor.clear.cgColor
        customView3.layer?.backgroundColor = NSColor.clear.cgColor
        customView4.layer?.backgroundColor = NSColor.clear.cgColor
        
        
        
    }
    
    @IBAction func customView2ButtonPressed(_ sender: Any) {
        if todayToggle != "yes" {
            lineViewTitleLabel.stringValue = "Average Breakfast Revenue"
        } else {
            lineViewTitleLabel.stringValue = "Today's Breakfast Revenue"
        }
        loadLineChart()
        
        
        customView1PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView2PercentageChange.textColor = NSColor.white
        customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        
        customView1.layer?.backgroundColor = NSColor.clear.cgColor
        customView2.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
        customView3.layer?.backgroundColor = NSColor.clear.cgColor
        customView4.layer?.backgroundColor = NSColor.clear.cgColor
        
    }
    
    @IBAction func customView3ButtonPressed(_ sender: Any) {
        if todayToggle != "yes" {
            lineViewTitleLabel.stringValue = "Average Lunch Revenue"
        } else {
            lineViewTitleLabel.stringValue = "Today's Lunch Revenue"
        }
        loadLineChart()
    
        customView1PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView3PercentageChange.textColor = NSColor.white
        customView4PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        
        customView1.layer?.backgroundColor = NSColor.clear.cgColor
        customView2.layer?.backgroundColor = NSColor.clear.cgColor
        customView3.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
        customView4.layer?.backgroundColor = NSColor.clear.cgColor
        
    }
    
    @IBAction func customView4ButtonPressed(_ sender: Any) {
        if todayToggle != "yes" {
            lineViewTitleLabel.stringValue = "Average Daily Visitors"
        } else {
            lineViewTitleLabel.stringValue = "Today's Visitors"
        }
        
        loadLineChart()
        
        
        
        customView1PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView2PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView3PercentageChange.textColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1)
        customView4PercentageChange.textColor = NSColor.white
        
        
        customView1.layer?.backgroundColor = NSColor.clear.cgColor
        customView2.layer?.backgroundColor = NSColor.clear.cgColor
        customView3.layer?.backgroundColor = NSColor.clear.cgColor
        customView4.layer?.backgroundColor = NSColor(calibratedRed: 86/255, green: 190/255, blue: 107/255, alpha: 1).cgColor
        
    }
    
    
    
    
    @IBAction func breakfastButtonPressed(_ sender: Any) {
        breakfastButton.bezelColor = NSColor.lightGray
        lunchButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        monday1.stringValue = "Sausage English Muffin Sandwaich or Nutrition Bar"
        monday2.stringValue = "String Cheese"
        monday3.stringValue = "Granny Smith Apple and Sliced Apple Cup"
        monday4.stringValue = "Fat Free / Low Fat Milk"
        
        tuesday1.stringValue = "Apple Frudel or Chicken Biscuity w/ Egg Patty"
        tuesday2.stringValue = "Diced Peaches"
        tuesday3.stringValue = "Fresh Banana"
        tuesday4.stringValue = "Fat Free / Low Fat Milk"
        
        wednesday1.stringValue = "Breakfast Pizza or Cinnamon Mini Bagels w/ Cream Cheese"
        wednesday2.stringValue = "Mixed Salad"
        wednesday3.stringValue = "Red Delicious Apple"
        wednesday4.stringValue = "Fat Free / Low Fat Milk"
        
        thursday1.stringValue = "Waffle w/Sausage Patty or Strawberry Mini Bageles w/ Jelly"
        thursday2.stringValue = "Golden Delicious Apple"
        thursday3.stringValue = "Mixed Applesauce Cup"
        thursday4.stringValue = "Fat Free / Low Fat Milk"
        
        friday1.stringValue = "French Toast Sticks w/ Sausage Patty or Strawberry Yogurt Parfait"
        friday2.stringValue = "Granny Smith Apple"
        friday3.stringValue = "Blueberry Applesauce"
        friday4.stringValue = "Fat Free / Low Fat Milk"
        
        
    }
    
    @IBAction func lunchButtonPressed(_ sender: Any) {
        breakfastButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        lunchButton.bezelColor = NSColor.lightGray
        monday1.stringValue = "Traditions: Meat Ball Sub, Honor Roll: BBQ Rib Sandwich"
        monday2.stringValue = "Fast Takes: Chicken Caesar Salad, Buffalo Chicken Wrap"
        monday3.stringValue = "Mixed Vegetables, Garden Bar Tossed Salad"
        monday4.stringValue = "Fat Free / Low Fat Milk"
        
        tuesday1.stringValue = "Mexican: Tacu Tuesday, Beef or Pulled Pork Tacos"
        tuesday2.stringValue = "Fast Takes: Crispy Chicken Salad, Southwest BBQ Chicken Sub"
        tuesday3.stringValue = "Hash Brown Round, Garden Bar Tossed Salad"
        tuesday4.stringValue = "Fat Free / Low Fat Milk"
        
        wednesday1.stringValue = "Traditions: Pulled Spicy Korean Sub, Upper Crust: Italian Sausage Pizza"
        wednesday2.stringValue = "Fast Takes: Chicken Caesar Salad, Crispy Chicken Wrap"
        wednesday3.stringValue = "Roasted Broccoli & Carrots, Garden Bar Tossed Salad"
        wednesday4.stringValue = "Fat Free / Low Fat Milk"
        
        thursday1.stringValue = "Honor Roll: Hot Dog, Upper Crust: Buffalo Chicken Pizza"
        thursday2.stringValue = "Fast Takes: Buffalo Chicken Salad, Italian Sub"
        thursday3.stringValue = "Aztec Corn, Garden Bar Tossed Salad"
        thursday4.stringValue = "Fat Free / Low Fat Milk"
        
        friday1.stringValue = "Traditions: Chicken Nuggets w/ Dinner Roll, Strawberry Parfaits"
        friday2.stringValue = "Fast Takes: Chicken Caesar Salad, Chicken Bacon Ranch Wrap"
        friday3.stringValue = "Mashed Potatoes & Gravy, Garden Bar Tossed Salad"
        friday4.stringValue = "Fat Free / Low Fat Milk"
        
    }
   
    @IBAction func weekMonthButtonPressed(_ sender: Any) {
        weekButton.bezelColor = NSColor.lightGray
        monthButton.bezelColor = NSColor.black
        sixMonthButton.bezelColor = NSColor.black
        
        weekConstraint.constant = 132
        revenueConstraint.constant = 134
        expenseConstraint.constant = 134
        
        secondMonthGroupStack.isHidden = true
        secondMonthExpenseStack.isHidden = true
        secondMonthRevenueStack.isHidden = true
        
        fFirstMonth.stringValue = "Last Week"
        fSecondMonth.stringValue = "This Week"
        fThirdMonth.stringValue = "% Change"
        
        //Revenue
        breakfast1.stringValue = "$8,748"
        breakfast2.stringValue = "$9,240"
        breakfastPercent.stringValue = "5.4%"
        breakfastPercent.textColor = NSColor.systemGreen
        
        lunch1.stringValue = "$13,122"
        lunch2.stringValue = "$14,250"
        lunchPercent.stringValue = "8%"
        lunchPercent.textColor = NSColor.systemGreen
        
        snacks1.stringValue = "$5,470"
        snacks2.stringValue = "$4,540"
        snacksPercent.stringValue = "17.1%"
        snacksPercent.textColor = NSColor.systemRed
        
        other1.stringValue = "$4,550"
        other2.stringValue = "$6,500"
        otherPercent.stringValue = "30%"
        otherPercent.textColor = NSColor.systemGreen
        
        totalRevenue1.stringValue = "$31,890"
        totalRevenue2.stringValue = "$34,530"
        totalRevenuePercent.stringValue = "7.7%"
        totalRevenuePercent.textColor = NSColor.systemGreen
        
        totalRevenue1.textColor = NSColor.systemGreen
        totalRevenue2.textColor = NSColor.systemGreen
        
        //Expense
        foodCost1.stringValue = "$3,500"
        foodCost2.stringValue = "$4,200"
        foodCostPercent.stringValue = "16.7%"
        foodCostPercent.textColor = NSColor.systemGreen
        
        laborCost1.stringValue = "$2,000"
        laborCost2.stringValue = "$2,000"
        laborCostPercent.stringValue = "0%"
        laborCostPercent.textColor = NSColor.systemGreen
        
        supplies1.stringValue = "$0"
        supplies2.stringValue = "$0"
        suppliesPercent.stringValue = "0%"
        suppliesPercent.textColor = NSColor.systemGreen
        
        equipment1.stringValue = "$0"
        equipment2.stringValue = "$0"
        equipmentPercent.stringValue = "0%"
        equipmentPercent.textColor = NSColor.systemGreen
        
        utilities1.stringValue = "$0"
        utilities2.stringValue = "$0"
        utilitiesPercent.stringValue = "0%"
        utilitiesPercent.textColor = NSColor.systemGreen
        
        marketing1.stringValue = "$0"
        marketing2.stringValue = "$0"
        marketingPercent.stringValue = "0%"
        marketingPercent.textColor = NSColor.systemGreen
        
        expenseOther1.stringValue  = "$0"
        expenseOther2.stringValue = "$0"
        expenseOtherPercent.stringValue = "0%"
        expenseOtherPercent.textColor = NSColor.systemGreen
        
        
        totalExpenses1.stringValue = "$5,500"
        totalExpenses2.stringValue = "$6,200"
        totalExpensesPercent.stringValue = "11.3%"

        totalExpenses1.textColor = NSColor.systemRed
        totalExpenses2.textColor = NSColor.systemRed
        totalExpensesPercent.textColor = NSColor.systemRed
        
        netIncome1.stringValue = "$26,390"
        netIncome2.stringValue = "$28,330"
        netIncomePercent.stringValue = "6.9%"
        
        netIncome1.textColor = NSColor.systemGreen
        netIncome2.textColor = NSColor.systemGreen
        netIncomePercent.textColor = NSColor.systemGreen
        
    }
    
    @IBAction func monthButtonPressed(_ sender: Any) {
        weekButton.bezelColor = NSColor.black
        monthButton.bezelColor = NSColor.lightGray
        sixMonthButton.bezelColor = NSColor.black
        
        weekConstraint.constant = 132
        revenueConstraint.constant = 134
        expenseConstraint.constant = 134
        
        secondMonthGroupStack.isHidden = true
        secondMonthExpenseStack.isHidden = true
        secondMonthRevenueStack.isHidden = true
        
        fFirstMonth.stringValue = "Last Month"
        fSecondMonth.stringValue = "This Month"
        fThirdMonth.stringValue = "% Change"
        
        //Revenue
        breakfast1.stringValue = "$32,995"
        breakfast2.stringValue = "$36,960"
        breakfastPercent.stringValue = "10.8%"
        breakfastPercent.textColor = NSColor.systemGreen
        
        lunch1.stringValue = "$52,488"
        lunch2.stringValue = "$57,360"
        lunchPercent.stringValue = "8.5%"
        lunchPercent.textColor = NSColor.systemGreen
        
        snacks1.stringValue = "$21,540"
        snacks2.stringValue = "$17,450"
        snacksPercent.stringValue = "18.99%"
        snacksPercent.textColor = NSColor.systemRed
        
        other1.stringValue = "$18,890"
        other2.stringValue = "$25,598"
        otherPercent.stringValue = "27.21%"
        otherPercent.textColor = NSColor.systemGreen
        
        totalRevenue1.stringValue = "$125,913"
        totalRevenue2.stringValue = "$137,368"
        totalRevenuePercent.stringValue = "8.93%"
        
        totalRevenuePercent.textColor = NSColor.systemGreen
        totalRevenue1.textColor = NSColor.systemGreen
        totalRevenue2.textColor = NSColor.systemGreen
        
        //Expense
        foodCost1.stringValue = "$14,350"
        foodCost2.stringValue = "$15,240"
        foodCostPercent.stringValue = "16.7%"
        foodCostPercent.textColor = NSColor.systemGreen
        
        laborCost1.stringValue = "$8,000"
        laborCost2.stringValue = "$8,000"
        laborCostPercent.stringValue = "0%"
        laborCostPercent.textColor = NSColor.systemGreen
        
        supplies1.stringValue = "$0"
        supplies2.stringValue = "$0"
        suppliesPercent.stringValue = "0%"
        suppliesPercent.textColor = NSColor.systemGreen
        
        equipment1.stringValue = "$0"
        equipment2.stringValue = "$0"
        equipmentPercent.stringValue = "0%"
        equipmentPercent.textColor = NSColor.systemGreen
        
        utilities1.stringValue = "$0"
        utilities2.stringValue = "$0"
        utilitiesPercent.stringValue = "0%"
        utilitiesPercent.textColor = NSColor.systemGreen
        
        marketing1.stringValue = "$0"
        marketing2.stringValue = "$0"
        marketingPercent.stringValue = "0%"
        marketingPercent.textColor = NSColor.systemGreen
        
        expenseOther1.stringValue  = "$0"
        expenseOther2.stringValue = "$0"
        expenseOtherPercent.stringValue = "0%"
        expenseOtherPercent.textColor = NSColor.systemGreen
        
        totalExpenses1.stringValue = "$22,350"
        totalExpenses2.stringValue = "$23,240"
        totalExpensesPercent.stringValue = "3.9%"
        
        totalExpenses1.textColor = NSColor.systemRed
        totalExpenses2.textColor = NSColor.systemRed
        totalExpensesPercent.textColor = NSColor.systemRed
        
        netIncome1.stringValue = "$103,563"
        netIncome2.stringValue = "$114,128"
        netIncomePercent.stringValue = "9.3%"
        
        netIncome1.textColor = NSColor.systemGreen
        netIncome2.textColor = NSColor.systemGreen
        netIncomePercent.textColor = NSColor.systemGreen
    }
    
    
    @IBAction func sixMonthButtonPressed(_ sender: Any) {
        weekButton.bezelColor = NSColor.black
        monthButton.bezelColor = NSColor.black
        sixMonthButton.bezelColor = NSColor.lightGray
        
        weekConstraint.constant = 65
        revenueConstraint.constant = 65
        expenseConstraint.constant = 65
        
        secondMonthGroupStack.isHidden = false
        secondMonthExpenseStack.isHidden = false
        secondMonthRevenueStack.isHidden = false
        
        //Revenue
        breakfastPercent.stringValue = "$35,830"
        lunchPercent.stringValue = "$55,850"
        snacksPercent.stringValue = "$23,980"
        otherPercent.stringValue = "$14,750"
        totalRevenuePercent.stringValue = "$130,410"
        
        breakfastPercent.textColor = NSColor.white
        lunchPercent.textColor = NSColor.white
        snacksPercent.textColor = NSColor.white
        otherPercent.textColor = NSColor.white
        totalRevenuePercent.textColor = NSColor.white
        
        fFirstMonth.stringValue = "January"
        fSecondMonth.stringValue = "February"
        fThirdMonth.stringValue = "March"
        sFirstMonth.stringValue = "April"
        sSecondMonth.stringValue = "May"
        sThirdMonth.stringValue = "June"
        
        
        sBreakfast1.stringValue = "$35,795"
        sBreakfast2.stringValue = "$34,580"
        sBreakfastPercent.stringValue = "$36,690"
        
        sLunch1.stringValue = "$54,784"
        sLunch2.stringValue = "$55,639"
        sLunchPercent.stringValue = "$55,717"
        
        sSnacks1.stringValue = "$24,580"
        sSnacks2.stringValue = "$22,390"
        sSnacksPercent.stringValue = "$23,399"
        
        sOther1.stringValue = "$14,490"
        sOther2.stringValue = "$15,650"
        sOtherPercent.stringValue = "$15,439"
        
        sTotalRevenue1.stringValue = "$129,649"
        sTotalRevenue2.stringValue = "$128,259"
        sTotalRevenuePercent.stringValue = "$131,245"
        
        sTotalRevenue1.textColor = NSColor.systemGreen
        sTotalRevenue2.textColor = NSColor.systemGreen
        totalRevenue1.textColor = NSColor.systemGreen
        totalRevenue2.textColor = NSColor.systemGreen
        totalRevenuePercent.textColor = NSColor.systemGreen
        sTotalRevenuePercent.textColor = NSColor.systemGreen
        
        //Expense
        foodCost1.stringValue = "$13,270"
        foodCost2.stringValue = "$14,960"
        foodCostPercent.stringValue = "$14,690"
        foodCostPercent.textColor = NSColor.white
        
        laborCost1.stringValue = "$8,000"
        laborCost2.stringValue = "$8,000"
        laborCostPercent.stringValue = "$8,000"
        laborCostPercent.textColor = NSColor.white
        
        supplies1.stringValue = "$0"
        supplies2.stringValue = "$0"
        suppliesPercent.stringValue = "$0"
        suppliesPercent.textColor = NSColor.white
        
        equipment1.stringValue = "$0"
        equipment2.stringValue = "$0"
        equipmentPercent.stringValue = "$0"
        equipmentPercent.textColor = NSColor.white
        
        utilities1.stringValue = "$0"
        utilities2.stringValue = "$0"
        utilitiesPercent.stringValue = "$0"
        utilitiesPercent.textColor = NSColor.white
        
        marketing1.stringValue = "$0"
        marketing2.stringValue = "$0"
        marketingPercent.stringValue = "$0"
        marketingPercent.textColor = NSColor.white
        
        expenseOther1.stringValue  = "$0"
        expenseOther2.stringValue = "$0"
        expenseOtherPercent.stringValue = "$0"
        expenseOtherPercent.textColor = NSColor.white
        
        
        totalExpenses1.stringValue = "$21,270"
        totalExpenses2.stringValue = "$22,960"
        totalExpensesPercent.stringValue = "$22,690"
        
        totalExpensesPercent.textColor = NSColor.systemRed
        totalExpenses1.textColor = NSColor.systemRed
        totalExpenses2.textColor = NSColor.systemRed
        
        netIncome1.stringValue = "$104,643"
        netIncome2.stringValue = "$114,408"
        netIncomePercent.stringValue = "$107,720"
        
        netIncome1.textColor = NSColor.systemGreen
        netIncome2.textColor = NSColor.systemGreen
        netIncomePercent.textColor = NSColor.systemGreen
        
        //Second Expense
        sFoodCost1.stringValue = "$14,270"
        sFoodCost2.stringValue = "$13,290"
        sFoodCostPercent.stringValue = "$14,970"
        sFoodCostPercent.textColor = NSColor.white
        
        sLaborCost1.stringValue = "$8,000"
        sLaborCost2.stringValue = "$8,000"
        sLaborCostPercent.stringValue = "$8,000"
        sLaborCostPercent.textColor = NSColor.white
        
        sSupplies1.stringValue = "$0"
        sSupplies2.stringValue = "$0"
        sSuppliesPercent.stringValue = "$0"
        sSuppliesPercent.textColor = NSColor.white
        
        sEquipment1.stringValue = "$0"
        sEquipment2.stringValue = "$0"
        sEquipmentPercent.stringValue = "$0"
        sEquipmentPercent.textColor = NSColor.white
        
        sUtilities1.stringValue = "$0"
        sUtilities2.stringValue = "$0"
        sUtilitiesPercent.stringValue = "$0"
        sUtilitiesPercent.textColor = NSColor.white
        
        sMarketing1.stringValue = "$0"
        sMarketing2.stringValue = "$0"
        sMarketingPercent.stringValue = "$0"
        sMarketingPercent.textColor = NSColor.white
        
        sExpenseOther1.stringValue  = "$0"
        sExpenseOther2.stringValue = "$0"
        sExpenseOtherPercent.stringValue = "$0"
        sExpenseOtherPercent.textColor = NSColor.white
        
        sTotalExpenses1.stringValue = "$22,270"
        sTotalExpenses2.stringValue = "$21,290"
        sTotalExpensesPercent.stringValue = "$22,970"
        
        sTotalExpenses1.textColor = NSColor.systemRed
        sTotalExpenses2.textColor = NSColor.systemRed
        sTotalExpensesPercent.textColor = NSColor.systemRed
        
        sNetIncome1.stringValue = "$107,379"
        sNetIncome2.stringValue = "$106,969"
        sNetIncomePercent.stringValue = "$108,275"
        
        sNetIncome1.textColor = NSColor.systemGreen
        sNetIncome2.textColor = NSColor.systemGreen
        sNetIncomePercent.textColor = NSColor.systemGreen
        
        
    }
    
}

extension GMRight: NSCollectionViewDelegate, NSCollectionViewDataSource {
    
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        if collectionView == self.collectionView {
            return NSSize(width: 250, height: 170)
        } else {
            return NSSize(width: 173, height: 145)
        }
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return schools.count
        } else {
            return monthlyMenu.count
        }
    }
    
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        if collectionView == self.collectionView {
            let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SchoolCollection"), for: indexPath) as! SchoolCollection
            
            let data = schools[indexPath.item]
            item.label.stringValue = data.school
            item.label.textColor = NSColor.white
            
            item.buttonTapped = {
                let color = item.view.layer?.backgroundColor
                self.typeOfSchool.isHidden = true
                self.typeOfSchool.stringValue = data.typeOfSchool
                
                
                if color == NSColor.black.cgColor {
                    item.view.layer?.backgroundColor = NSColor.gray.cgColor
                    
                    if self.toggle == "Inventory" {
                        self.inventoryView.isHidden = false
                        self.setupInventory()
                        
                    } else if self.toggle == "Menu" {
                        self.inventoryView.isHidden = true
                        self.breakfastButton.bezelColor = NSColor.lightGray
                        self.lunchButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
                        self.dayOfTheWeekStack.isHidden = false
                        self.dayOfTheWeekLabel.isHidden = false
                        self.monthlyScrollView.isHidden = false
                        self.monthlyMenuLabel.isHidden = false
                        self.menuStack.isHidden = false
                        self.setupMonthlyMenu()
                        
                        
                    } else if self.toggle == "Staff" {
                        self.inventoryView.isHidden = true
                        self.managerLabel.isHidden = false
                        self.managerImage.isHidden = false
                        self.managerName.isHidden = false
                        self.hoursThisWeekLabel.isHidden = false

                        self.hoursThisWeekHours.isHidden = false
                        self.lateThisWeekLabel.isHidden = false
                        self.lateThisWeekTimes.isHidden = false
                        self.lateThisMonthLabel.isHidden = false
                        self.lateThisMonthTimes.isHidden = false
                        self.managerMessageButton.isHidden = false

                        self.staffLabel.isHidden = false
                        self.staffScrollView.isHidden = false
                        self.totalTimesLateByStaffLabel.isHidden = false
                        self.totalTimesLateByStaffTimes.isHidden = false
                    }
                } else {
                    item.view.layer?.backgroundColor = NSColor.black.cgColor
                    
                    if self.toggle == "Inventory" {
                        self.inventoryView.isHidden = true
                    } else if self.toggle == "Menu" {
                        
                        self.breakfastButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
                        self.lunchButton.bezelColor = NSColor(calibratedRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
                        self.dayOfTheWeekStack.isHidden = true
                        self.dayOfTheWeekLabel.isHidden = true
                        self.monthlyScrollView.isHidden = true
                        self.monthlyMenuLabel.isHidden = true
                        self.menuStack.isHidden = true
                        self.typeOfSchool.isHidden = true
                        self.monthlyMenu.removeAll()
                        self.monthlyCollectionView.reloadData()
                        
                    } else if self.toggle == "Staff" {
                        self.managerLabel.isHidden = true
                        self.managerImage.isHidden = true
                        self.managerName.isHidden = true
                        self.hoursThisWeekLabel.isHidden = true

                        self.hoursThisWeekHours.isHidden = true
                        self.lateThisWeekLabel.isHidden = true
                        self.lateThisWeekTimes.isHidden = true
                        self.lateThisMonthLabel.isHidden = true
                        self.lateThisMonthTimes.isHidden = true
                        self.managerMessageButton.isHidden = true

                        self.staffLabel.isHidden = true
                        self.staffScrollView.isHidden = true
                        self.totalTimesLateByStaffLabel.isHidden = true
                        self.totalTimesLateByStaffTimes.isHidden = true
                        
                    }
                }
                for i in 0..<self.schools.count {
                    if i != indexPath.item {
                        collectionView.item(at: i)?.view.layer?.backgroundColor = NSColor.black.cgColor
                    }
                }
                
            }
            //
            return item
        } else {
            let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MonthlyMenu"), for: indexPath) as! MonthlyMenu
            
            
            return item
        }
        
    }
    
}

extension GMRight: NSTableViewDelegate, NSTableViewDataSource {
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        if tableView == staffTableView {
            return 10
        } else if tableView == inventoryTableView {
            return inventoryList.count
        } else {
            print("vendor count 1 \(vendors.count)")
            return vendors.count
        }
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if tableView == staffTableView {
            let item = staffTableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableCell"), owner: self) as! StaffView
            
            
            item.individualImage.wantsLayer = true
            item.individualImage.layer?.borderWidth = 1
            item.individualImage.layer?.masksToBounds = false
            item.individualImage.layer?.borderColor = NSColor.white.cgColor
            item.individualImage.layer?.cornerRadius = item.individualImage.frame.height/2
            item.individualImage.layer?.masksToBounds = true
            
            item.individualName.textColor = NSColor.white
            item.hoursWorked.textColor = NSColor.white
            item.individualImage.image = NSImage(named: "headshot1")
            print("happening item \(row)")
            return item
        } else if tableView == inventoryTableView {
            let item = inventoryTableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableCell"), owner: self) as! InventoryList
            
            print("row number \(row)")
            let list = inventoryList[row]
            
            item.product.stringValue = list.product
            item.quantity.stringValue = list.quantity
            item.product.textColor = NSColor.white
            item.quantity.textColor = NSColor.white
            
            
            
            return item
            
        } else {
            let item = vendorTableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableCell"), owner: self) as! VendorsCell
            
            let vendors = self.vendors[row]
            
            item.vendors.stringValue = "\(vendors.vendor)"
            item.phone.stringValue = "Phone: \(vendors.phone)"
            item.email.stringValue = "Email: \(vendors.email)"
            item.phone.textColor = NSColor.white
            item.email.textColor = NSColor.white
            item.vendors.textColor = NSColor.white
           
            return item
        }
        
    }
    
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        if tableView == staffTableView {
            return CGFloat(50)
        } else if tableView == inventoryTableView {
            return CGFloat(35)
        } else {
            return CGFloat(71)
        }
    }
    
    
    
    
}
