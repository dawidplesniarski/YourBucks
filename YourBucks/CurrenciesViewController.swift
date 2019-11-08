//
//  CurrenciesViewController.swift
//  YourBucks
//
//  Created by Dawid on 08/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class CurrenciesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let url = URL(string: "https://api.exchangeratesapi.io/latest") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                 }
               }
           }.resume()
        }
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
