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
    
    var carAmount: Double = 1
    var houseHoldAmount: Double = 1
    var billsAmount: Double = 1
    var foodAmount: Double = 1
    var healthAmount: Double = 1
    var hygieneAmount: Double = 1
    
    
    var carDataEntry = PieChartDataEntry(value: 0.0)
    var houseHoldDataEntry = PieChartDataEntry(value: 0.0)
    var billsDataEntry = PieChartDataEntry(value: 0.0)
    var foodDataEntry = PieChartDataEntry(value: 0.0)
    var healthDataEntry = PieChartDataEntry(value: 0.0)
    var hygieneDataEntry = PieChartDataEntry(value: 0.0) // deklaruje kategorie wydatków



    
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
        houseHoldDataEntry.value = houseHoldAmount
        billsDataEntry.value = billsAmount
        foodDataEntry.value = foodAmount
        healthDataEntry.value = healthAmount
        hygieneDataEntry.value = hygieneAmount
        
        // ustawiam wartosci wydatków w danych kategoriach
        
        numberOfDownloadsDataEntries = [carDataEntry,houseHoldDataEntry,billsDataEntry,foodDataEntry,healthDataEntry,hygieneDataEntry]  //przypisuje liczbę kategorii znajdujących się w wykresach
        print("1 widok ",carAmount)
        updateChartData()   // uaktualniam wykres
    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named:"pastel_pink"),UIColor(named:"azure"),UIColor(named:"orange"),UIColor(named:"light_purple"),UIColor(named:"pastel_yellow"),UIColor(named:"pastel_green")]
        
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
    }
    

}

