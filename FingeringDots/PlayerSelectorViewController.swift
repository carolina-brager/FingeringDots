//
//  PlayerSelectorViewController.swift
//  FingeringDots
//
//  Created by Carolina I. Brager on 2/25/17.
//  Copyright © 2017 Carolina I. Brager. All rights reserved.
//

import UIKit
import Foundation

protocol DataSentDelegate{
    func userDidEnterData(data: String)
    func userDidEnterData2(data: String)
}

class PlayerSelectorViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    @IBOutlet weak var begin: UIButton!
    
    var delegate: DataSentDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        begin.backgroundColor = .clear
        begin.layer.cornerRadius = 8
        begin.layer.borderWidth = 3
        begin.layer.borderColor = UIColor.blue.cgColor
        begin.contentEdgeInsets = UIEdgeInsetsMake(5,5,5,5)
        
        self.player1.delegate = self
        self.player2.delegate = self
        
    }
    
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if segue.identfier == "segue1"{
            if let destinationVC = segue.TwoPlayerViewController as? TwoPlayerViewController {
                destinationVC.player1Name = player1.text
            }
        }
    }*/
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    public func getPlayer1Name()->String{
        return player1.text!
    }
    
    public func getPlayer2Name()->String{
        return player2.text!
    }
    

    @IBAction func beginPressed(_ sender: Any) {
        if delegate != nil{
            if player1.text != nil{
                let data = player1.text
                delegate?.userDidEnterData(data: data!)
                dismiss(animated: true, completion: nil)
            }
            else{print("you suck 1")}
            if player2.text != nil{
                let data = player2.text
                delegate?.userDidEnterData2(data: data!)
                dismiss(animated: true, completion: nil)
            }
            else{print("you suck 2")}
        }
        else{print("why!!!!")}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
