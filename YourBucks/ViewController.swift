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
    
    
    var carAmount = Double()
    
    var carDataEntry = PieChartDataEntry(value: 0.0)
    var houseHoldDataEntry = PieChartDataEntry(value: 0.0)// deklaruje kategorie wydatków
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        //performSegue(withIdentifier: "myGoingBackSegue", sender: self)
        print("1 widok", carAmount)
        viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        
        carDataEntry.value = carAmount
        houseHoldDataEntry.value = 1
        
        // ustawiam wartosci wydatków w danych kategoriach
        
        numberOfDownloadsDataEntries = [carDataEntry,houseHoldDataEntry] // przypisuje liczbę kategorii znajdujących się w wykresach
        print("1 widok ",carAmount)
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

