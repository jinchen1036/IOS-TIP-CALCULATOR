//
//  SettingViewController.swift
//  TipCal
//
//  Created by Jin Chen on 8/7/18.
//  Copyright © 2018 Jin Chen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var TipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TipSet(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(TipControl.selectedSegmentIndex, forKey: "TipSel")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
