//
//  ExpenditureVC.swift
//  YourBucks
//
//  Created by Dawid on 14/10/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class ExpenditureVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {



    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var inputBlurEffect: UIVisualEffectView!
    @IBOutlet weak var doneButtonBlurEffect: UIVisualEffectView!
    @IBOutlet weak var pickerBlurEffect: UIVisualEffectView!
    
    var viewController = ViewController()
    let transactionsVC = TransactionsTableViewController()
    var transactionsCategory:String = ""
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let amount = Double(amountTextField.text!)

        if (segue.identifier == "myGoingBackSegue" && amountTextField.text != ""){
            
            print("going back segue called")
            
            let vc = segue.destination as! ViewController
            if(selectedCategory == 0)   {transactionsCategory = "Samochód"; vc.carAmount += amount ?? 0}
            if(selectedCategory == 1)   {transactionsCategory = "Dom"; vc.houseHoldAmount += amount ?? 0}
            if(selectedCategory == 2)   {transactionsCategory = "Rachunki"; vc.billsAmount += amount ?? 0}
            if(selectedCategory == 3)   {transactionsCategory = "Jedzenie"; vc.foodAmount += amount ?? 0}
            if(selectedCategory == 4)   {transactionsCategory = "Zdrowie"; vc.healthAmount += amount ?? 0}
            if(selectedCategory == 5)   {transactionsCategory = "Higiena"; vc.hygieneAmount += amount ?? 0}
            
            vc.userBalance -= amount ?? 0
    
            vc.transactions.append("Typ: wydatek\nKategoria: "+transactionsCategory + "\nKwota: -" + String(format:"%.2f", amount ?? 0) + " pln")
        }
    }
    
    var pickerData: [String] = [String]()
    
    var selectedCategory = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        radiusEffect()
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Samochód", "Dom", "Rachunki", "Jedzenie", "Zdrowie", "Artykuły Higieniczne"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView)  -> Int{
    return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        selectedCategory = row
        print(selectedCategory) // ustawiam zmienną selectedCategory na numer wiersza w pickerView
    }
    
    func radiusEffect(){
        inputBlurEffect.layer.cornerRadius = 10
        inputBlurEffect.clipsToBounds = true
        pickerBlurEffect.layer.cornerRadius = 12
        pickerBlurEffect.clipsToBounds = true
        doneButtonBlurEffect.layer.cornerRadius = 10
        doneButtonBlurEffect.clipsToBounds = true
    }
}
