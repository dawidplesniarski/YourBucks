//
//  ViewController.swift
//  YourBucks
//
//  Created by Dawid on 13/10/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    
    var carDataEntry = PieChartDataEntry(value: 0.0)
    var houseHoldDataEntry = PieChartDataEntry(value: 0.0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        
        
        carDataEntry.value = 50.0
        houseHoldDataEntry.value = 50.0
        
        numberOfDownloadsDataEntries = [carDataEntry,houseHoldDataEntry]
        updateChartData()

    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named:"pastel_pink"),UIColor(named:"azure")]
        
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
    }


}

