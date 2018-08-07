//
//  ViewController.swift
//  TipCal
//
//  Created by Jin Chen on 8/7/18.
//  Copyright © 2018 Jin Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TipControl: UISegmentedControl!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var p1Label: UILabel!
    @IBOutlet weak var p2Label: UILabel!
    @IBOutlet weak var p3Label: UILabel!
    @IBOutlet weak var p4Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BillField.backgroundColor = UIColor(red: 153/255, green: 255/255, blue: 255/255, alpha: 1)
        BillField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // update the tip amount
        let defaults = UserDefaults.standard
        TipControl.selectedSegmentIndex = defaults.integer(forKey: "TipSel")
        Calculate(self)
    }
    
    
    @IBAction func Calculate(_ sender: Any) {
        let tipPer = [0.18, 0.20, 0.25][TipControl.selectedSegmentIndex] // tip percentage
        let bill = Double(BillField.text!) ?? 0 // Get Bill Value
        
        let tip = bill * tipPer // Get Tip Value
        let p1 = bill + tip
        let p2 = p1/2
        let p3 = p1/3
        let p4 = p1/4
        
        // Set format of locale currency
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        // Update Label
        TipLabel.text = formatter.string(from: tip as NSNumber)
        p1Label.text  = formatter.string(from: p1 as NSNumber)
        p2Label.text  = formatter.string(from: p2 as NSNumber)
        p3Label.text  = formatter.string(from: p3 as NSNumber)
        p4Label.text  = formatter.string(from: p4 as NSNumber)
        
     }
    
    @IBAction func Keyboard(_ sender: Any) {
        view.endEditing(true) // Dismiss Keyboard
    }
    

}

