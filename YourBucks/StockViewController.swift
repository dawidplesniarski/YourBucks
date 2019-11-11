//
//  StockViewController.swift
//  YourBucks
//
//  Created by Dawid on 11/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit
import Foundation

class StockViewController: UIViewController {
    
    struct Stock: Decodable{
        let Symbol: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let headers = [
            "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com",
            "x-rapidapi-key": "a2d517e4ffmsh650e4c3bfad7206p1116b6jsn13fb1330774c"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/get-detail?region=US&lang=en&symbol=NBEV")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
            }
        })

        dataTask.resume() */
        
        
        /*
        let url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&interval=1min&apikey=AOIAMG3WFZ8LS58W"
        let urlObj = URL(string: url)
        URLSession.shared.dataTask(with: urlObj!) { data, response, error in
            do{
                var stocks = try JSONDecoder().decode([Stock].self, from: data!)
                
                for stock in stocks {
                    print(stock.Symbol)
                }
            }catch{
                print("Error")
            }
        }.resume() */
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
