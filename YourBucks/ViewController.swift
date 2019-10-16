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

    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var userBalanceTextField: UITextField!
    
    var sallaryAmount: Double = 50
    var bonusAmount: Double = 1
    var savingsAmount: Double = 1
    var paymentAmount: Double = 50   // zmienne określające wielkość poszczególnych przychodów
    
    
    var sallaryDataEntry = BarChartDataEntry(x: 0.0, yValues: [100.0])
    var bonusDataEntry = BarChartDataEntry(x: 0.0, yValues: [100.0])
    var savingsDataEntry = BarChartDataEntry(x: 0.0, yValues: [100.0])
    var paymentDataEntry = BarChartDataEntry(x: 0.0, yValues: [100.0])

    
    var carAmount: Double = 1
    var houseHoldAmount: Double = 1
    var billsAmount: Double = 1
    var foodAmount: Double = 1
    var healthAmount: Double = 1
    var hygieneAmount: Double = 1
//zmienne okreslajace salda poszczegolnych kategorii (domyslnie 0.0)
    
    var userBalance: Double = 0.0 //zmienna okreslajaca saldo calkowite
    
    var carDataEntry = PieChartDataEntry(value: 0.0)
    var houseHoldDataEntry = PieChartDataEntry(value: 0.0)
    var billsDataEntry = PieChartDataEntry(value: 0.0)
    var foodDataEntry = PieChartDataEntry(value: 0.0)
    var healthDataEntry = PieChartDataEntry(value: 0.0)
    var hygieneDataEntry = PieChartDataEntry(value: 0.0) // deklaruje kategorie wydatków



    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    var numberOfDownloadBarDataEntries = [BarChartDataEntry]()
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        //performSegue(withIdentifier: "myGoingBackSegue", sender: self)
        //print("1 widok", carAmount)
        viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userBalanceTextField.text = String(userBalance) + " zł"
        
        pieChart.chartDescription?.text = "Wydatki"
        
        carDataEntry.value = carAmount
        carDataEntry.label = "Samochód"
        
        houseHoldDataEntry.value = houseHoldAmount
        houseHoldDataEntry.label = "Dom"
        
        billsDataEntry.value = billsAmount
        billsDataEntry.label = "Rachunki"
        
        foodDataEntry.value = foodAmount
        foodDataEntry.label = "Jedzenie"
        
        healthDataEntry.value = healthAmount
        healthDataEntry.label = "Zdrowie"
        
        hygieneDataEntry.value = hygieneAmount
        hygieneDataEntry.label = "Higiena"
        // ustawiam wartosci wydatków w danych kategoriach
        
        numberOfDownloadsDataEntries = [carDataEntry,houseHoldDataEntry,billsDataEntry,foodDataEntry,healthDataEntry,hygieneDataEntry]  //przypisuje liczbę kategorii znajdujących się w wykresach
        
        
        
        barChart.chartDescription?.text = "Dochody"
        sallaryDataEntry.yValues = [sallaryAmount]
        bonusDataEntry.yValues = [bonusAmount]
        savingsDataEntry.yValues = [savingsAmount]
        paymentDataEntry.yValues = [paymentAmount]
        
        
        numberOfDownloadBarDataEntries = [sallaryDataEntry,bonusDataEntry,savingsDataEntry,paymentDataEntry]
        
        //print("1 widok ",carAmount)
        updateChartData()   // uaktualniam wykres
    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let barChartDataSet = BarChartDataSet(entries: numberOfDownloadBarDataEntries, label: nil)
        let barChartData = BarChartData(dataSet: barChartDataSet)
        
        let colors = [UIColor(named:"pastel_pink"),UIColor(named:"azure"),UIColor(named:"orange"),UIColor(named:"light_purple"),UIColor(named:"pastel_yellow"),UIColor(named:"pastel_green")]
        
        let barColors = [UIColor(named:"pastel_pink"),UIColor(named:"orange"),UIColor(named:"pastel_yellow"),UIColor(named:"pastel_green")]
        
        chartDataSet.colors = colors as! [NSUIColor]
        barChartDataSet.colors = barColors as! [NSUIColor]

        
        pieChart.data = chartData
        barChart.data = barChartData
        
    }
    

}

