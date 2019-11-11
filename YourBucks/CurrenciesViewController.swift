//
//  CurrenciesViewController.swift
//  YourBucks
//
//  Created by Dawid on 08/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//
import UIKit

class CurrenciesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet weak var currencyOutput: UITextField!
    @IBOutlet weak var currencyInput: UITextField!
    @IBOutlet weak var baseCurrencyPickerView: UIPickerView!
    @IBOutlet weak var targetCurrencyPickerView: UIPickerView!
    
    var myCurrency:[String] = []
    var myValue:[Double] = []
    var activeCurrency:Double = 0
    var currencyQuery:String = "PLN"
    /*
    struct Currencies {
        let currencyName: String
        let currencyAmount: Double
        let baseCurrency: String
        let currencyDate: Date
    }
    */
    
    @IBAction func calculateCurrency(_ sender: Any) {
        let userInput:Double = Double(currencyInput.text!)!
        currencyOutput.text = String(userInput * activeCurrency)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData()
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView)  -> Int{
       return 1
       }
       
       // The number of rows of data
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return myCurrency.count
       }
       
       // The data to return fopr the row and component (column) that's being passed in
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return myCurrency[row]
       }
       

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == baseCurrencyPickerView{
            currencyQuery = myCurrency[row]
            print("query: " + currencyQuery)
            loadJsonData()
        }
        if pickerView == targetCurrencyPickerView{
            activeCurrency = myValue[row]
            print(activeCurrency)
        }
       }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        viewDidDisappear(true)
    }
    
    
    func loadJsonData(){
        
        
        if let url = URL(string: "https://api.exchangeratesapi.io/latest?base="+currencyQuery) {
           URLSession.shared.dataTask(with: url) { data, response, error in
            if(error != nil) { print("error") }
            /*
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                 }
               }*/
            if(self.myValue != [] && self.myCurrency != []){
                self.myValue=[]
                self.myCurrency=[]
            }
            if let content = data
            {
            do{
                let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                if let rates = myJson["rates"] as? NSDictionary
                {
                    for (key,value) in rates
                    {
                        self.myCurrency.append((key as? String)!)
                        self.myValue.append((value as? Double)!)
                    }
                }
                }catch
                {
                print("append error")
                }
            }
            DispatchQueue.main.async { // Problem z przeładowaniem elementów rozwiązany metodą DispatchQueue.
                self.baseCurrencyPickerView.reloadAllComponents()
                self.targetCurrencyPickerView.reloadAllComponents()
            }
           }.resume()
        }
    }
}
