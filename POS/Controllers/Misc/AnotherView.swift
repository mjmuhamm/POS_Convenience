//
//  AnotherView.swift
//  POS
//
//  Created by Malik Muhammad on 7/2/23.
//

import Cocoa
import Charts
import DGCharts

class AnotherView: NSViewController, ChartViewDelegate {
    @IBOutlet weak var button1: NSButton!
    
 
    @IBOutlet var scrollView: NSScrollView!
    @IBOutlet var collectionView: NSCollectionView!
    
    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var customVie: BarChartView!
    @IBOutlet weak var pieChart: PieChartView!
    
    
    var imageTests : [ImageTest] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true
        self.view.layer!.backgroundColor = NSColor.white.cgColor
        
        
        collectionView.register(NSNib(nibNamed: "CollectionViewItem", bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"))
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
   
        
        loadi()
        load2()
        load3()
        lineChart.delegate = self
        pieChart.delegate = self
        customVie.delegate = self
        
        
        
    }
    

    
    private func configureCollectionView() {
      // 1
      let flowLayout = NSCollectionViewFlowLayout()
      flowLayout.itemSize = NSSize(width: 262.0, height: 247.0)
      flowLayout.sectionInset = NSEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
      flowLayout.minimumInteritemSpacing = 0.0
      flowLayout.minimumLineSpacing = 0.0
      collectionView.collectionViewLayout = flowLayout
      // 2
      view.wantsLayer = true
      // 3
      collectionView.layer?.backgroundColor = NSColor.black.cgColor
    }
    
    private func setupData() {
        var text1 = "pic1"
        for i in 0..<20 {
            
            if text1 == "pic1" { text1 = "pic2" } else { text1 = "pic1" }
            var image3 = NSImage(named: text1)!
            let text = "This is text \(i)."
            imageTests.append(ImageTest(image: image3, text: text))
            collectionView.animator().insertItems(at: [IndexPath(item: imageTests.count - 1, section: 0)])
            
//            collectionView.reloadData()
            
        }
        
    
    }
    
    @IBAction func barChartButtonPressed(_ sender: Any) {
        customVie.isHidden = false
        lineChart.isHidden = false
        pieChart.isHidden = false
        scrollView.isHidden = true
        collectionView.isHidden = true
        loadi()
        load2()
        load3()
    }
    
    @IBAction func collectionViewButton(_ sender: Any) {
        imageTests.removeAll()
        customVie.isHidden = true
        lineChart.isHidden = true
        pieChart.isHidden = true
        scrollView.isHidden = false
        collectionView.isHidden = false
        configureCollectionView()
        setupData()
    }
    
    
    
    public func loadi() {
        var weeklyData : [BarChartDataEntry] = [BarChartDataEntry(x: 0, y: 10), BarChartDataEntry(x: 1, y: 20), BarChartDataEntry(x: 2, y: 30), BarChartDataEntry(x: 3, y: 40), BarChartDataEntry(x: 3, y: 15), BarChartDataEntry(x: 3, y: 50)]
        let labels = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6"]
        
        
        
        
        self.customVie.data?.notifyDataChanged()
        
        let set = BarChartDataSet(entries: weeklyData)
        set.colors = ChartColorTemplates.pastel()
        let data = BarChartData(dataSet: set)
        self.customVie.data = data
        self.customVie.xAxis.granularityEnabled = true
        self.customVie.xAxis.drawGridLinesEnabled = false
        //            customVie.xAxis.drawAxisLineEnabled = true
        self.customVie.leftAxis.drawAxisLineEnabled = false
        self.customVie.rightAxis.drawGridLinesEnabled = false
        self.customVie.xAxis.drawAxisLineEnabled = true
        self.customVie.leftAxis.drawAxisLineEnabled = true
        self.customVie.rightAxis.drawAxisLineEnabled = true
        self.customVie.leftAxis.drawGridLinesEnabled = false
        self.customVie.xAxis.axisMinimum = 0.2
        self.customVie.xAxis.labelPosition = XAxis.LabelPosition.bottom
        self.customVie.xAxis.labelCount = labels.count
        self.customVie.xAxis.centerAxisLabelsEnabled = true
        
        let groupSpace = 0.1
        let barSpace = 0.05
        let barWidth = 0.25
        
        let gg = data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        //                customVie.xAxis.axisMaximum = Double(0) + gg * 6
        self.customVie.xAxis.axisMaximum = 6
        self.customVie.xAxis.axisMinimum = 0
        data.groupBars(fromX:0, groupSpace: groupSpace, barSpace: barSpace)
        self.customVie.xAxis.labelCount = labels.count
        self.customVie.xAxis.centerAxisLabelsEnabled = true
        data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        
        self.customVie.xAxis.granularityEnabled = true
        //            customVie.xAxis.spaceMin = 0.3
        self.customVie.xAxis.labelWidth = 1
        self.customVie.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuart)
    }
    
    public func load2() {
        var data1 = LineChartData()
        var weeklyData = [ChartDataEntry]()
        
        var a = [ChartDataEntry(x: 0, y: 10), ChartDataEntry(x: 1, y: 20), ChartDataEntry(x: 2, y: 30), ChartDataEntry(x: 3, y: 40), ChartDataEntry(x: 4, y: 20), ChartDataEntry(x: 5, y: 80), ChartDataEntry(x: 6, y: 10), ChartDataEntry(x: 7, y: 25)]
        
        var b = [ChartDataEntry(x: 0, y: 60), ChartDataEntry(x: 1, y: 95), ChartDataEntry(x: 2, y: 115), ChartDataEntry(x: 3, y: 85), ChartDataEntry(x: 4, y: 107), ChartDataEntry(x: 5, y: 130), ChartDataEntry(x: 6, y: 139), ChartDataEntry(x: 7, y: 105)]
        
        let labels = ["Week 1", "Week 2", "Week 3", "Week 4"]
        
        
        
        
        self.customVie.data?.notifyDataChanged()
        
        let set = LineChartDataSet(entries: a)
        let set1 = LineChartDataSet(entries: b)
        data1.dataSets.append(set)
        data1.dataSets.append(set1)
        
        set.colors = ChartColorTemplates.pastel()
//        let data = LineChartData(dataSet: data1)
        self.lineChart.data = data1
        self.lineChart.xAxis.granularityEnabled = true
        self.lineChart.xAxis.drawGridLinesEnabled = false
        //            customVie.xAxis.drawAxisLineEnabled = true
        self.lineChart.leftAxis.drawAxisLineEnabled = false
        self.lineChart.rightAxis.drawGridLinesEnabled = false
        self.lineChart.xAxis.drawAxisLineEnabled = true
        self.lineChart.leftAxis.drawAxisLineEnabled = true
        self.lineChart.rightAxis.drawAxisLineEnabled = true
        self.lineChart.leftAxis.drawGridLinesEnabled = false
        self.lineChart.xAxis.axisMinimum = 0.2
        self.lineChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        self.lineChart.xAxis.labelCount = labels.count
                   
        self.lineChart.xAxis.labelCount = labels.count
       
        self.lineChart.xAxis.granularityEnabled = true
        //            customVie.xAxis.spaceMin = 0.3
        self.lineChart.xAxis.labelWidth = 1
        self.lineChart.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInOutQuart)
    }
    
    
    private func load3() {
        
        var pieChartData : [PieChartDataEntry] = []
        self.pieChart.clearValues()
        self.pieChart.clear()
        
        
        var array1 = [".", ".", ".", ".", "."]
        var x = 25
        for i in 0..<array1.count {
            x += 25
            pieChartData.append(PieChartDataEntry(value: Double(x), label: ""))
            
            let set = PieChartDataSet(entries: pieChartData)
            set.colors = ChartColorTemplates.pastel()
            self.pieChart.entryLabelColor = .clear
            set.entryLabelFont = .systemFont(ofSize: 11)
            let data = PieChartData(dataSet: set)
            self.pieChart.data = data
            self.pieChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuart)
        }
    }
    
    
}
    
extension AnotherView: NSCollectionViewDataSource, NSCollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageTests.count
    }
    
    
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"), for: indexPath) as! CollectionViewItem
        
         
        let data = imageTests[indexPath.item]
        
        
        item.image1.image = data.image
        item.label2.stringValue = data.text
        
        item.buttonTapped = {
            if item.selectImage.isHidden == true {
                item.selectImage.isHidden = false
            } else {
                item.selectImage.isHidden = true
            }
            
        }
        
        return item
    }
    
  
    
}


