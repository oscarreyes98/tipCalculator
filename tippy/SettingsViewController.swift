//
//  SettingsViewController.swift
//  tippy
//
//  Created by Oscar Reyes on 12/26/16.
//  Copyright © 2016 Oscar Reyes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefaultTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaultTipControl.selectedSegmentIndex = defaults.object(forKey: "default_tip_percentage") as! Int

   }
}
