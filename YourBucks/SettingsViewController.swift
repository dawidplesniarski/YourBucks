//
//  SettingsViewController.swift
//  YourBucks
//
//  Created by Dawid on 19/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let mainVC = ViewController()

    @IBAction func deleteSettingsPressed(_ sender: Any) {
        mainVC.ResetData()
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
}
