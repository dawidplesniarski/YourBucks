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
    
    var carAmount = 70.0

    
    var carDataEntry = PieChartDataEntry(value: 0.0)
    var houseHoldDataEntry = PieChartDataEntry(value: 0.0)// deklaruje kategorie wydatków
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        
        carDataEntry.value = carAmount
        houseHoldDataEntry.value = 50.0
        // ustawiam wartosci wydatków w danych kategoriach
        
        numberOfDownloadsDataEntries = [carDataEntry,houseHoldDataEntry] // przypisuje liczbę kategorii znajdujących się w wykresach
        print(carAmount)
        updateChartData()   // uaktualniam wykres

    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named:"pastel_pink"),UIColor(named:"azure")]
        
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
    }


}

