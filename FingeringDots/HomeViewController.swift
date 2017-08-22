//GreenDot
//  HomeViewController.swift
//  FingeringDots
//
//  Created by Carolina I. Brager on 2/25/17.
//  Copyright © 2017 Carolina I. Brager. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startSinglePlayer(_ sender: UIButton) {
        print("Single Player")
    }
    
    @IBAction func startTwoPlayer(_ sender: UIButton) {
        print("Two Player")
    }
    @IBAction func openInstructions(_ sender: UIButton) {
        print("Instructions")
    }
    
}
