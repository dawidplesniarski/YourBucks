//
//  TransactionsTableViewController.swift
//  YourBucks
//
//  Created by Dawid on 01/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class TransactionsTableViewController: UITableViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return transactions.count
    }
    


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = transactions[indexPath.row]

        let transactionName = transactions[indexPath.row]
        cell.textLabel?.text = transactionName
        return cell
    }
}
