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
    
    struct Currencies {
        let currencyName: String
        let currencyAmount: Double
        let baseCurrency: String
        let currencyDate: Date
    }
     
    
    @IBAction func calculateCurrency(_ sender: Any) {
        //currencyOutput.text = String(Double(currencyInput.text) * activeCurrency)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        if let url = URL(string: "https://api.exchangeratesapi.io/latest") {
           URLSession.shared.dataTask(with: url) { data, response, error in
            if(error != nil) { print("error") }
            /*
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                 }
               }*/
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
            }
           }.resume()
        }
    }
    
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.exchangeratesapi.io/latest"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            if(err != nil){
                print("Error")
            }else{
                guard let data = data else {return}
                
                do {
                    let course = try
                        JSONDecoder().decode(Currencies.self, from: data)
                    print(course.rates)
                }catch{
                    
            }
        }
    }
    } */
    
    
    func numberOfComponents(in baseCurrencyPickerView: UIPickerView)  -> Int{
       return 1
       }
       
       // The number of rows of data
       func pickerView(_ baseCurrencyPickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return myCurrency.count
       }
       
       // The data to return fopr the row and component (column) that's being passed in
       func pickerView(_ baseCurrencyPickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return myCurrency[row]
       }
       

       func pickerView(_ baseCurrencyPickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           activeCurrency = myValue[row]
       }
   
    
}


/*
let url = URL(string: "https://api.exchangeratesapi.io/latest")
let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
if (error != nil)
{
    print("Error")
}
else
{
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
                print(content)
            }
        }
        }catch
        {
        print("append error")
        }
    }
}
//self.baseCurrencyPickerView.reloadAllComponents()
}
task.resume()
  print(myCurrency)
  print(myValue) */
