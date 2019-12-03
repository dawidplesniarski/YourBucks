//
//  TransactionsTableViewController.swift
//  YourBucks
//
//  Created by Dawid on 01/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class TransactionsTableViewController: UITableViewController {
    
    
    var tableTransactions = [String]()
    let viewController = ViewController()
    let backgroundImage = UIImage(named: "light_city_background.png")
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)

    /*
   
     */

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.addSubview(blurEffectView)
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
        cell.backgroundColor = UIColor.clear
        cell.textLabel!.numberOfLines = 3
        
        cell.textLabel?.text = tableTransactions[indexPath.row]

        let transactionName = tableTransactions[indexPath.row]
        cell.textLabel?.text = transactionName
        return cell
    }
}
