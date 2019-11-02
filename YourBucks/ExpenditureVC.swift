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
    
    var viewController = ViewController()
    let transactionsVC = TransactionsTableViewController()
    var transactionsCategory:String = ""
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let amount = Double(amountTextField.text!)

        if segue.identifier == "myGoingBackSegue"{
            
            print("going back segue called")
            
            let vc = segue.destination as! ViewController
            if(selectedCategory == 0)   {transactionsCategory = "Samochód"; vc.carAmount += amount ?? 0}
            if(selectedCategory == 1)   {transactionsCategory = "Dom"; vc.houseHoldAmount += amount ?? 0}
            if(selectedCategory == 2)   {transactionsCategory = "Rachunki"; vc.billsAmount += amount ?? 0}
            if(selectedCategory == 3)   {transactionsCategory = "Jedzenie"; vc.foodAmount += amount ?? 0}
            if(selectedCategory == 4)   {transactionsCategory = "Zdrowie"; vc.healthAmount += amount ?? 0}
            if(selectedCategory == 5)   {transactionsCategory = "Higiena"; vc.hygieneAmount += amount ?? 0}
            vc.userBalance -= amount ?? 0
            //transactionsVC.transactions?.append((type: "Wydatek", category: transactionsCategory, amount: amount ?? 0))
            transactionsVC.transactionCategory = transactionsCategory
            transactionsVC.transcactionAmount = amount ?? 0.0
            transactionsVC.expAdded()
            //viewController.SaveData()
        }
    }

    /*
    @IBAction func addButton(_ sender: UIButton) {
        
        let amount = Double(amountTextField.text!)
        print(amount!)
       /*
        switch selectedCategory {
        case 0:
            viewController.carAmount += amount ?? 0
        case 1:
            viewController.houseHoldAmount += amount ?? 0
        case 2:
            viewController.billsAmount += amount ?? 0
        case 3:
            viewController.foodAmount += amount ?? 0
        case 4:
            viewController.healthAmount += amount ?? 0
        case 5:
            viewController.healthAmount += amount ?? 0
        default:
            viewController.carAmount += amount ?? 0
        }
        */
        print("2 widok: ",viewController.carAmount)
        
        
        //self.dismiss(animated: true, completion: nil) //zamykanie 2 widoku
        
    } */
    var pickerData: [String] = [String]()
    
    var selectedCategory = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    

}
