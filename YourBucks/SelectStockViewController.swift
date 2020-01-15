//
//  SelectStockViewController.swift
//  YourBucks
//
//  Created by Dawid on 15/01/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit

class SelectStockViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerBlurEffect: UIVisualEffectView!
    @IBOutlet weak var buttonBlurEffect: UIVisualEffectView!
    
    let stocksSymbols:[String] = ["AAPL","MSFT","SBUX","AMZN","NKE","EBAY","JAGX"]
    var stockSymbol:String = "AAPL"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stocksSymbols.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stocksSymbols[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stockSymbol = stocksSymbols[row]
        print(stockSymbol)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
