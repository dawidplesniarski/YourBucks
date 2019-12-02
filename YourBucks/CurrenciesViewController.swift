//
//  CurrenciesViewController.swift
//  YourBucks
//
//  Created by Dawid on 08/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//
import UIKit



extension String {
  var isDigits: Bool {
    guard !self.isEmpty else { return false }
    return !self.contains { Double(String($0)) == nil }
  }
}

class CurrenciesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet weak var currencyOutput: UITextField!
    @IBOutlet weak var currencyInput: UITextField!
    @IBOutlet weak var baseCurrencyPickerView: UIPickerView!
    @IBOutlet weak var targetCurrencyPickerView: UIPickerView!
    
    @IBOutlet weak var typeAmountBlurEffect: UIVisualEffectView!
    @IBOutlet weak var baseCurrencyBlurEffect: UIVisualEffectView!
    @IBOutlet weak var targetCurrencyBlurEffect: UIVisualEffectView!
    @IBOutlet weak var calculateButton: UIVisualEffectView!
    @IBOutlet weak var resultBlurEffect: UIVisualEffectView!
    @IBOutlet weak var backButtonBlurEffect: UIVisualEffectView!
    
    var myCurrency:[String] = []
    var myValue:[Double] = []
    var activeCurrency:Double = 0
    var currencyQuery:String = "PLN"

    
    @IBAction func calculateCurrency(_ sender: Any) {
        if(currencyInput.text != "" && currencyInput.text?.isDigits == true){
        let userInput:Double = Double(currencyInput.text!)!
        currencyOutput.text = String(userInput * activeCurrency)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radiusEffect()
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
            //print("query: " + currencyQuery)
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
    
    func radiusEffect(){
        typeAmountBlurEffect.layer.cornerRadius = 10
        typeAmountBlurEffect.clipsToBounds = true
        resultBlurEffect.layer.cornerRadius = 10
        resultBlurEffect.clipsToBounds = true
        backButtonBlurEffect.layer.cornerRadius = 10
        backButtonBlurEffect.clipsToBounds = true
        baseCurrencyBlurEffect.layer.cornerRadius = 12
        baseCurrencyBlurEffect.clipsToBounds = true
        targetCurrencyBlurEffect.layer.cornerRadius = 12
        targetCurrencyBlurEffect.clipsToBounds = true
        calculateButton.layer.cornerRadius = 10
        calculateButton.clipsToBounds = true
    }
}
