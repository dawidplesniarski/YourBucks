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

    @IBOutlet var MenuButtons: [UIButton]!
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var userBalanceTextField: UITextField!
    
    var transactions = [String]()

    
    let saveAmount = UserDefaults.standard

    
    var sallaryAmount: Double = 0.0
    var bonusAmount: Double = 0.0
    var savingsAmount: Double = 0.0
    var paymentAmount: Double = 0.0  // zmienne określające wielkość poszczególnych przychodów
    
    
    var sallaryDataEntry = BarChartDataEntry(x: 10.0, yValues: [10.0])
    var bonusDataEntry = BarChartDataEntry(x: 12.0, yValues: [10.0])
    var savingsDataEntry = BarChartDataEntry(x: 14.0, yValues: [10.0])
    var paymentDataEntry = BarChartDataEntry(x: 16.0, yValues: [10.0])

    
    var carAmount: Double = 0.0
    var houseHoldAmount: Double = 0.0
    var billsAmount: Double = 0.0
    var foodAmount: Double = 0.0
    var healthAmount: Double = 0.0
    var hygieneAmount: Double = 0.0
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
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {   // Funkcja przekazuje wartosci zmiennych dwukierunkowo
        print(transactions)
        SaveData()  // zapisuje zaktualizowane dane do urządzenia
        viewDidLoad()   // Odświeżam ekran
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestoreData()   // Odtwarzam zapisane dane po uruchomieniu ekranu
        
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
        
        //barChart.drawValueAboveBarEnabled = false

        
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
    
    
    func SaveData(){
        // Zapisuje wartość zmiennych przychodów
        saveAmount.set(userBalance, forKey: "userBalance")
        saveAmount.set(sallaryAmount, forKey: "sallaryAmount")
        saveAmount.set(bonusAmount, forKey: "bonusAmount")
        saveAmount.set(savingsAmount, forKey: "savingsAmount")
        saveAmount.set(paymentAmount, forKey: "paymentAmount")
        
        //zapisuję wartość zmiennych wydatków
        saveAmount.set(carAmount, forKey: "carAmount")
        saveAmount.set(houseHoldAmount, forKey: "houseHoldAmount")
        saveAmount.set(billsAmount, forKey: "billsAmount")
        saveAmount.set(foodAmount, forKey: "foodAmount")
        saveAmount.set(healthAmount, forKey: "healthAmount")
        saveAmount.set(hygieneAmount, forKey: "hygieneAmount")
    }
    
    func RestoreData(){
        //odtwarzam wartosci zmiennych po otworzeniu aplikacji
        userBalance = saveAmount.double(forKey: "userBalance")
        sallaryAmount = saveAmount.double(forKey: "sallaryAmount")
        bonusAmount = saveAmount.double(forKey: "bonusAmount")
        savingsAmount = saveAmount.double(forKey: "savingsAmount")
        paymentAmount = saveAmount.double(forKey: "paymentAmount")
        
        carAmount = saveAmount.double(forKey: "carAmount")
        houseHoldAmount = saveAmount.double(forKey: "houseHoldAmount")
        billsAmount = saveAmount.double(forKey: "billsAmount")
        foodAmount = saveAmount.double(forKey: "foodAmount")
        healthAmount = saveAmount.double(forKey: "healthAmount")
        hygieneAmount = saveAmount.double(forKey: "hygieneAmount")
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        MenuButtons.forEach{(button) in
            UIView.animate(withDuration: 0.7, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    

}

