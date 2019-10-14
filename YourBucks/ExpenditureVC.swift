//
//  ExpenditureVC.swift
//  YourBucks
//
//  Created by Dawid on 14/10/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class ExpenditureVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = [String]()

    
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
    


}
