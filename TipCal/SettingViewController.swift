//
//  SettingViewController.swift
//  TipCal
//
//  Created by Jin Chen on 8/7/18.
//  Copyright © 2018 Jin Chen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var tip1: UILabel!
    @IBOutlet weak var tip2: UILabel!
    @IBOutlet weak var tip3: UILabel!
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var stepper3: UIStepper!
    @IBOutlet weak var numPicker: UIPickerView!
    
    var nums = Array(1...20)  // 20 Selection for Number to Split
    var numSplit = 1          // Initial default Number to Split
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(nums[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nums.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        numSplit = nums[row]
        self.Changes(self)
        print(nums[row])
    }

    
    @IBAction func Changes(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // Update Labels Text
        tip1.text = String(Int(stepper1.value))
        tip2.text = String(Int(stepper2.value))
        tip3.text = String(Int(stepper3.value))

        // Update Value into Default Keys
        defaults.set(Int(stepper1.value), forKey: "tip1")
        defaults.set(Int(stepper2.value), forKey: "tip2")
        defaults.set(Int(stepper3.value), forKey: "tip3")
        defaults.set(numSplit, forKey: "numSplit")
        defaults.synchronize()
    }
    
}
