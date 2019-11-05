//
//  TransactionsTableViewController.swift
//  YourBucks
//
//  Created by Dawid on 01/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class TransactionsTableViewController: UITableViewController {
    
    /*
    //var transactions:[(type: String, category: String, amount: Double)]?
    
    var transactionCategory:String = ""
    var transcactionAmount:Double = 0.0
    var completeTransaction:String = ""
    
    //var transactions = [String]()
    var transactions = ["test","test1","test2","test3"]
    
    func expAdded(){
        completeTransaction = "Typ: Wydatek Kategoria: "+transactionCategory+" Kwota: "+String(transcactionAmount)
        transactions.append(completeTransaction)
        print(completeTransaction)
    }
     */
    var tableTransactions = [String]()
    
    let viewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tableTransactions)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableTransactions.count
    }
    


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel!.numberOfLines = 3
        
        cell.textLabel?.text = tableTransactions[indexPath.row]

        let transactionName = tableTransactions[indexPath.row]
        cell.textLabel?.text = transactionName
        return cell
    }
}
