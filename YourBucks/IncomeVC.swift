//
//  IncomeVC.swift
//  YourBucks
//
//  Created by Dawid on 16/10/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class IncomeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var viewController = ViewController()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let amount = Double(amountTextField.text!)
        
        let vc = segue.destination as! ViewController

        if(selectedCategory == 0){ vc.sallaryAmount += amount ?? 0}
        if(selectedCategory == 1){ vc.bonusAmount += amount ?? 0}
        if(selectedCategory == 2){ vc.savingsAmount += amount ?? 0}
        if(selectedCategory == 3){ vc.paymentAmount += amount ?? 0}


        vc.userBalance += amount ?? 0
    }
    
    var pickerData: [String] = [String]()
    
    var selectedCategory = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        pickerData = ["Pensja","Premia","Oszczędności","Wpłaty"]
        
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
