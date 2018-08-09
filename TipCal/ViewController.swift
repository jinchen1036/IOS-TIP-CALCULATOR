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
    @IBOutlet weak var defaultNum: UILabel!
    @IBOutlet weak var defaultValue: UILabel!
    
    var tipPers: [Int] = [15, 20, 25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // BillField.backgroundColor = UIColor(red: 153/255, green: 255/255, blue: 255/255, alpha: 1)
        //BillField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // update the variable from setting page
        let defaults = UserDefaults.standard
        tipPers[0] = defaults.integer(forKey: "tip1")
        tipPers[1] = defaults.integer(forKey: "tip2")
        tipPers[2] = defaults.integer(forKey: "tip3")
        
        TipControl.setTitle("\(tipPers[0])"+"%", forSegmentAt: 0)
        TipControl.setTitle("\(tipPers[1])"+"%", forSegmentAt: 1)
        TipControl.setTitle("\(tipPers[2])"+"%", forSegmentAt: 2)
        
        defaultNum.text = String(defaults.integer(forKey: "numSplit"))
        //print("Change", tipPers)
        Calculate(self)
    }
    
    
    @IBAction func Calculate(_ sender: Any) {
        //print("Original", tipPers)
        
        let tipPer = Double(tipPers[TipControl.selectedSegmentIndex])/100 // tip percentage
        //print(tipPer)
        let bill = Double(BillField.text!) ?? 0 // Get Bill Value
        
        let tip = bill * tipPer  // Get Tip Value
        let p1 = bill + tip
        let p2 = p1/2
        let p3 = p1/3
        let p4 = p1/4
        let numSplit = Double(defaultNum.text!) ?? 1
        let p5 = p1/numSplit
        
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
        defaultValue.text = formatter.string(from: p5 as NSNumber)
        
        // Change Color For diffenent Tip Percentage
        if TipControl.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor(red:0.00, green:0.87, blue:0.84, alpha:1.0)
            BillField.backgroundColor = UIColor(red:0.66, green:0.96, blue:0.95, alpha:1.0)
        }
        else if TipControl.selectedSegmentIndex == 1 {
            self.view.backgroundColor = UIColor(red:1.00, green:0.00, blue:1.00, alpha:1.0)
            BillField.backgroundColor = UIColor(red: 0.95, green: 0.72, blue: 0.94, alpha: 1.0)
            
        }
        else {
            self.view.backgroundColor = UIColor(red:0.00, green:0.87, blue:0.45, alpha:1.0)
            BillField.backgroundColor = UIColor(red:0.35, green:0.98, blue:0.51, alpha:1.0)
            
        }
        
    }
     
    
    @IBAction func Keyboard(_ sender: Any)
    {
        view.endEditing(true) // Dismiss Keyboard
    }
    

}

