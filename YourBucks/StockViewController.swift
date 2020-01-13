//
//  StockViewController.swift
//  YourBucks
//
//  Created by Dawid on 12/01/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit

struct Response: Codable {
    let metaData: MetaData
    let timeSeries5Min: [String: TimeSeries5Min]

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries5Min = "Time Series (5min)"
    }
}

// MARK: - MetaData
struct MetaData: Codable {
    let the1Information, the2Symbol, the3LastRefreshed, the4Interval: String
    let the5OutputSize, the6TimeZone: String

    enum CodingKeys: String, CodingKey {
        case the1Information = "1. Information"
        case the2Symbol = "2. Symbol"
        case the3LastRefreshed = "3. Last Refreshed"
        case the4Interval = "4. Interval"
        case the5OutputSize = "5. Output Size"
        case the6TimeZone = "6. Time Zone"
    }
}

// MARK: - TimeSeries5Min
struct TimeSeries5Min: Codable {
    let the1Open, the2High, the3Low, the4Close: String
    let the5Volume: String

    enum CodingKeys: String, CodingKey {
        case the1Open = "1. open"
        case the2High = "2. high"
        case the3Low = "3. low"
        case the4Close = "4. close"
        case the5Volume = "5. volume"
    }
}
class StockViewController: UIViewController {

    final let url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&apikey=NUFI25GZVGUHNMLL"
    
    var openData:[String] = []
    var highData:[String] = []
    var lowData:[String] = []
    var closeData:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL()
    }
    
    func loadURL() {
    
      let stocksURL = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&apikey=NUFI25GZVGUHNMLL")
      URLSession.shared.dataTask(with: stocksURL!) { (data, response, error) in
        if let error = error {
          print(error)
          return
        }
        do {
          let response = try JSONDecoder().decode(Response.self, from: data!)
          response.timeSeries5Min.forEach({ (keyValue) in
            //print(keyValue)
            //print(keyValue.value.the1Open)
            self.openData.append(keyValue.value.the1Open)
            //self.closeData.append(keyValue.value.the4Close)
            //self.lowData.append(keyValue.value.the3Low)
            //self.highData.append(keyValue.value.the2High)
          })
        } catch {
          print(error)
        }
      }.resume()
    }

}
