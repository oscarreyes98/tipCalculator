//
//  ViewController.swift
//  tippy
//
//  Created by Oscar Reyes on 12/14/16.
//  Copyright © 2016 Oscar Reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder() ;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        if let tipValue = defaults.object(forKey: "default_tip_percentage"){
        
        tipControl.selectedSegmentIndex = tipValue as! Int;
        }
        defaults.synchronize()
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
   
    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.synchronize()
        
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    

}

