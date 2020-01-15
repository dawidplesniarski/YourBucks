//
//  StockViewController.swift
//  YourBucks
//
//  Created by Dawid on 12/01/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit
import Charts



struct Response: Codable {
    let metaData: MetaData
    let timeSeries5Min: [String: TimeSeries5Min]

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries5Min = "Time Series (5min)"
    }
}

// MARK: - Metadane informacje giełdowe
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



// MARK: - TimeSeries5Min - dane giełdowe
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

    
    @IBAction func buttontapped(_ sender: Any) {
        updateChartData()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var stockNameField: UITextField!
    @IBOutlet weak var candleChartView: CandleStickChartView!
    
    var stockSymbol:String = "AAPL"
    var stockName:String = ""
    var openData:[Double] = []
    var highData:[Double] = []
    var lowData:[Double] = []
    var closeData:[Double] = [] //tablice przechowujące informacje giełdowe
 
    
    override var shouldAutorotate: Bool {
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

        self.title = "Candle Stick Chart"
        
        candleChartView.delegate = self as? ChartViewDelegate
               
        candleChartView.chartDescription?.enabled = false
               
        candleChartView.dragEnabled = true
        candleChartView.setScaleEnabled(true)
        candleChartView.maxVisibleCount = 200
        candleChartView.pinchZoomEnabled = true
        candleChartView.leftAxis.labelTextColor = .white
        candleChartView.rightAxis.labelTextColor = .white
        candleChartView.xAxis.labelTextColor = .white
        candleChartView.legend.textColor = .white
        candleChartView.legend.drawInside = false
        loadURL()
    }
    
    
    
    
    func updateChartData() {    //uaktualniam wykres
        DispatchQueue.main.async {
            self.setDataCount()
        }
    }
    
    
    
    
    func setDataCount() {   //przypisuje wartosci giełdowe
        let yVals1 = (0..<(openData.count)).map { (i) -> CandleChartDataEntry in
        //let val = volumeData[i]
        let high = highData[i]
        let low = lowData[i]
        let open = openData[i]
        let close = closeData[i]
        //let even = i % 2 == 0
        
        return CandleChartDataEntry(x: Double(i), shadowH: high, shadowL: low, open: open, close: close, icon: UIImage(named: "icon")!)
        }
        
        let set1 = CandleChartDataSet(entries: yVals1, label: "Data Set")
        set1.axisDependency = .left
        set1.setColor(UIColor(white: 80/255, alpha: 1))
        set1.drawIconsEnabled = false
        set1.shadowColor = .darkGray
        set1.shadowWidth = 0.7
        set1.drawValuesEnabled = false
        set1.decreasingColor = .red
        set1.decreasingFilled = true
        set1.increasingColor = UIColor(red: 122/255, green: 242/255, blue: 84/255, alpha: 1)
        set1.increasingFilled = true
        set1.neutralColor = .blue
        
        let data = CandleChartData(dataSet: set1)
        candleChartView.data = data
    }

    
    func loadURL() {
    
      let stocksURL = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(stockSymbol)&interval=5min&apikey=NUFI25GZVGUHNMLL")
      URLSession.shared.dataTask(with: stocksURL!) { (data, response, error) in
        if let error = error {
          print(error)
          return
        }
        do {
          let response = try JSONDecoder().decode(Response.self, from: data!)
          response.timeSeries5Min.forEach({ (keyValue) in
                self.openData.append(Double(keyValue.value.the1Open)!)
                self.closeData.append(Double(keyValue.value.the4Close)!)
                self.lowData.append(Double(keyValue.value.the3Low)!)
                self.highData.append(Double(keyValue.value.the2High)!)
                //self.volumeData.append(Double(keyValue.value.the5Volume)!)
          })
            DispatchQueue.main.async {
                self.stockNameField.text = response.metaData.the2Symbol
            }
        } catch {
          print(error)
        }
        self.updateChartData()
        }.resume()
    }
}
