//
//  TwoPlayerViewController.swift
//  FingeringDots
//
//  Created by Carolina I. Brager on 2/25/17.
//  Copyright © 2017 Carolina I. Brager. All rights reserved.
//

import UIKit


class TwoPlayerViewController: UIViewController/*, DataSentDelegate */{
    
    @IBOutlet weak var green: UIImageView!
    @IBOutlet weak var yellow: UIImageView!
    @IBOutlet weak var blue: UIImageView!
    @IBOutlet weak var red: UIImageView!
    @IBOutlet weak var greyBar: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var loseMessage: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var green1: UIButton!
    @IBOutlet weak var green2: UIButton!
    @IBOutlet weak var green3: UIButton!
    @IBOutlet weak var green4: UIButton!
    
    @IBOutlet weak var yellow1: UIButton!
    @IBOutlet weak var yellow2: UIButton!
    @IBOutlet weak var yellow3: UIButton!
    @IBOutlet weak var yellow4: UIButton!
    
    @IBOutlet weak var blue1: UIButton!
    @IBOutlet weak var blue2: UIButton!
    @IBOutlet weak var blue3: UIButton!
    @IBOutlet weak var blue4: UIButton!
    
    @IBOutlet weak var red1: UIButton!
    @IBOutlet weak var red2: UIButton!
    @IBOutlet weak var red3: UIButton!
    @IBOutlet weak var red4: UIButton!
    
    var player1Name = String()
    var player2Name = String()
    
    var thumbP1 = UIButton()
    var indexP1 = UIButton()
    var middleP1 = UIButton()
    var ringP1 = UIButton()
    
    var thumbP2 = UIButton()
    var indexP2 = UIButton()
    var middleP2 = UIButton()
    var ringP2 = UIButton()
    
    var greenCounter = 0;
    var yellowCounter = 0;
    var blueCounter = 0;
    var redCounter = 0;
    
    var lost = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        playButton.backgroundColor = .clear
        playButton.layer.cornerRadius = 8
        playButton.layer.borderWidth = 3
        playButton.layer.borderColor = UIColor.blue.cgColor
        playButton.contentEdgeInsets = UIEdgeInsetsMake(5,5,5,5)
        homeButton.backgroundColor = .clear
        homeButton.layer.cornerRadius = 8
        homeButton.layer.borderWidth = 3
        homeButton.layer.borderColor = UIColor.green.cgColor
        homeButton.contentEdgeInsets = UIEdgeInsetsMake(5,5,5,5)
        
    
        turnLabel.text = " "
    }
    
    func userDidEnterData(data: String) {
        print (data)
        player1Name = data
        
    }
    
    func userDidEnterData2(data: String){
        print (data)
        player2Name = data
    }
    
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
            let PlayerSelectorViewController: PlayerSelectorViewController = segue.destination as! PlayerSelectorViewController
            PlayerSelectorViewController.delegate = self
        }
        else{
            print("What?")}
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var colorSelected = String()
    
    var fingerSelected = UIButton()
    
    
    var played = false
    
    var player1turn = false
    var player2turn = true
    
    
    @IBAction func play(_ sender: UIButton) {
        player1Name = "Player1"
        player2Name = "Player2"
        loseMessage.text = " "
        if(player1turn){player1turn = false
        player2turn = true}
        else{player2turn = false
        player1turn = true}
        if(player1turn){turnLabel.text = player1Name + "'s turn"}
        if(player2turn){turnLabel.text = player2Name + "'s turn"}
        playButton.setTitle("Spin", for: .normal)
        lost = false
        var random = Int(arc4random_uniform(4)+12)
        var i = 0;
        
        while(i < random){
            if(i%4 == 0){
                if(greenCounter == 3){i+=i
                    random+=1;
                    green.image = #imageLiteral(resourceName: "GreenNS")
                    red.image = #imageLiteral(resourceName: "RedNS")
                }
                else{
                    green.image = #imageLiteral(resourceName: "Green")
                    red.image = #imageLiteral(resourceName: "RedNS")
                    colorSelected = "green"
                    i+=1
                }
            }else if(i%4 == 1){
                if(yellowCounter == 3){i+=i
                    random+=1;
                    yellow.image = #imageLiteral(resourceName: "YellowNS")
                    green.image = #imageLiteral(resourceName: "GreenNS")
                }
                else{
                    yellow.image = #imageLiteral(resourceName: "Yellow")
                    green.image = #imageLiteral(resourceName: "GreenNS")
                    colorSelected = "yellow"
                    i+=1
                }
            }else if(i%4 == 2){
                if(blueCounter == 3){
                    i+=i
                    random+=1;
                    blue.image = #imageLiteral(resourceName: "BlueNS")
                    yellow.image = #imageLiteral(resourceName: "YellowNS")
                }
                else{
                    blue.image = #imageLiteral(resourceName: "Blue")
                    yellow.image = #imageLiteral(resourceName: "YellowNS")
                    colorSelected = "blue"
                    i+=1
                }
            }else if(i%4 == 3){
                if(redCounter == 3){i+=i
                    random+=1
                    red.image = #imageLiteral(resourceName: "RedNS")
                    blue.image = #imageLiteral(resourceName: "BlueNS")
                }
                else{
                    red.image = #imageLiteral(resourceName: "Red")
                    blue.image = #imageLiteral(resourceName: "BlueNS")
                    colorSelected = "red"
                    i+=1
                }
            }
        }
        let random2 = Int(arc4random_uniform(4))
        if(random2 % 4 == 0){
            if(player1turn){fingerSelected = thumbP1}
            if(player2turn){fingerSelected = thumbP2}
            greyBar.setTitle("Thumb", for: .normal)
        }
        if(random2 % 4 == 1){
            if(player1turn){fingerSelected = indexP1}
            if(player2turn){fingerSelected = indexP2}
            greyBar.setTitle("Index", for: .normal)
        }
        if(random2 % 4 == 2){
            if(player1turn){fingerSelected = middleP1}
            if(player2turn){fingerSelected = middleP2}
            greyBar.setTitle("Middle", for: .normal)
        }
        if(random2 % 4 == 3){
            if(player1turn){fingerSelected = ringP1}
            if(player2turn){fingerSelected = ringP2}
            greyBar.setTitle("Ring", for: .normal)
        }
        playButton.isEnabled = false
        playButton.isHighlighted = true
    }
    
    func lose(){
        lost = true;
        thumbP1 = UIButton()
        indexP1 = UIButton()
        middleP1 = UIButton()
        ringP1 = UIButton()
        thumbP2 = UIButton()
        indexP2 = UIButton()
        middleP2 = UIButton()
        ringP2 = UIButton()
        green.image = #imageLiteral(resourceName: "GreenNS")
        yellow.image = #imageLiteral(resourceName: "YellowNS")
        blue.image = #imageLiteral(resourceName: "BlueNS")
        red.image = #imageLiteral(resourceName: "RedNS")
        blueCounter = 0
        yellowCounter = 0
        redCounter = 0
        greenCounter = 0
        greyBar.setTitle("", for: .normal)
        playButton.setTitle("Play", for: .normal)
    }
    
    //Search: Down Button
    
    @IBAction func green1Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        greenCounter+=1
        if(!(colorSelected == "green")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = green1}
            else if(fingerSelected == thumbP2){thumbP2 = green1}
            else if (fingerSelected == indexP1){indexP1 = green1}
            else if (fingerSelected == indexP2){indexP2 = green1}
            else if (fingerSelected == middleP1){middleP1 = green1}
            else if (fingerSelected == middleP2){middleP2 = green1}
            else if (fingerSelected == ringP1){ringP1 = green1}
            else if (fingerSelected == ringP2){ringP2 = green1}
        }
    }
    @IBAction func green2Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        greenCounter+=1
        if(!(colorSelected == "green")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = green2}
            else if(fingerSelected == thumbP2){thumbP2 = green2}
            else if (fingerSelected == indexP1){indexP1 = green2}
            else if (fingerSelected == indexP2){indexP2 = green2}
            else if (fingerSelected == middleP1){middleP1 = green2}
            else if (fingerSelected == middleP2){middleP2 = green2}
            else if (fingerSelected == ringP1){ringP1 = green2}
            else if (fingerSelected == ringP2){ringP2 = green2}
        }
    }
    @IBAction func green3Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        greenCounter+=1
        if(!(colorSelected == "green")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = green3}
            else if(fingerSelected == thumbP2){thumbP2 = green3}
            else if (fingerSelected == indexP1){indexP1 = green3}
            else if (fingerSelected == indexP2){indexP2 = green3}
            else if (fingerSelected == middleP1){middleP1 = green3}
            else if (fingerSelected == middleP2){middleP2 = green3}
            else if (fingerSelected == ringP1){ringP1 = green3}
            else if (fingerSelected == ringP2){ringP2 = green3}
        }
    }
    @IBAction func green4Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        greenCounter+=1
        if(!(colorSelected == "green")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = green4}
            else if(fingerSelected == thumbP2){thumbP2 = green4}
            else if (fingerSelected == indexP1){indexP1 = green4}
            else if (fingerSelected == indexP2){indexP2 = green4}
            else if (fingerSelected == middleP1){middleP1 = green4}
            else if (fingerSelected == middleP2){middleP2 = green4}
            else if (fingerSelected == ringP1){ringP1 = green4}
            else if (fingerSelected == ringP2){ringP2 = green4}
        }
    }
    @IBAction func yellow1Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        yellowCounter+=1
        if(!(colorSelected == "yellow")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = yellow1}
            else if(fingerSelected == thumbP2){thumbP2 = yellow1}
            else if (fingerSelected == indexP1){indexP1 = yellow1}
            else if (fingerSelected == indexP2){indexP2 = yellow1}
            else if (fingerSelected == middleP1){middleP1 = yellow1}
            else if (fingerSelected == middleP2){middleP2 = yellow1}
            else if (fingerSelected == ringP1){ringP1 = yellow1}
            else if (fingerSelected == ringP2){ringP2 = yellow1}
        }
    }
    @IBAction func yellow2Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        yellowCounter+=1
        if(!(colorSelected == "yellow")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = yellow2}
            else if(fingerSelected == thumbP2){thumbP2 = yellow2}
            else if (fingerSelected == indexP1){indexP1 = yellow2}
            else if (fingerSelected == indexP2){indexP2 = yellow2}
            else if (fingerSelected == middleP1){middleP1 = yellow2}
            else if (fingerSelected == middleP2){middleP2 = yellow2}
            else if (fingerSelected == ringP1){ringP1 = yellow2}
            else if (fingerSelected == ringP2){ringP2 = yellow2}
        }
    }
    @IBAction func yellow3Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        yellowCounter+=1
        if(!(colorSelected == "yellow")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = yellow3}
            else if(fingerSelected == thumbP2){thumbP2 = yellow3}
            else if (fingerSelected == indexP1){indexP1 = yellow3}
            else if (fingerSelected == indexP2){indexP2 = yellow3}
            else if (fingerSelected == middleP1){middleP1 = yellow3}
            else if (fingerSelected == middleP2){middleP2 = yellow3}
            else if (fingerSelected == ringP1){ringP1 = yellow3}
            else if (fingerSelected == ringP2){ringP2 = yellow3}
        }
    }
    @IBAction func yellow4Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        yellowCounter+=1
        if(!(colorSelected == "yellow")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = yellow4}
            else if(fingerSelected == thumbP2){thumbP2 = yellow4}
            else if (fingerSelected == indexP1){indexP1 = yellow4}
            else if (fingerSelected == indexP2){indexP2 = yellow4}
            else if (fingerSelected == middleP1){middleP1 = yellow4}
            else if (fingerSelected == middleP2){middleP2 = yellow4}
            else if (fingerSelected == ringP1){ringP1 = yellow4}
            else if (fingerSelected == ringP2){ringP2 = yellow4}
        }
    }
    
    @IBAction func blue1Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        blueCounter+=1
        if(!(colorSelected == "blue")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = blue1}
            else if(fingerSelected == thumbP2){thumbP2 = blue1}
            else if (fingerSelected == indexP1){indexP1 = blue1}
            else if (fingerSelected == indexP2){indexP2 = blue1}
            else if (fingerSelected == middleP1){middleP1 = blue1}
            else if (fingerSelected == middleP2){middleP2 = blue1}
            else if (fingerSelected == ringP1){ringP1 = blue1}
            else if (fingerSelected == ringP2){ringP2 = blue1}
        }
    }
    @IBAction func blue2Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        blueCounter+=1
        if(!(colorSelected == "blue")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = blue2}
            else if(fingerSelected == thumbP2){thumbP2 = blue2}
            else if (fingerSelected == indexP1){indexP1 = blue2}
            else if (fingerSelected == indexP2){indexP2 = blue2}
            else if (fingerSelected == middleP1){middleP1 = blue2}
            else if (fingerSelected == middleP2){middleP2 = blue2}
            else if (fingerSelected == ringP1){ringP1 = blue2}
            else if (fingerSelected == ringP2){ringP2 = blue2}
        }
    }
    @IBAction func blue3Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        blueCounter+=1
        if(!(colorSelected == "blue")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = blue3}
            else if(fingerSelected == thumbP2){thumbP2 = blue3}
            else if (fingerSelected == indexP1){indexP1 = blue3}
            else if (fingerSelected == indexP2){indexP2 = blue3}
            else if (fingerSelected == middleP1){middleP1 = blue3}
            else if (fingerSelected == middleP2){middleP2 = blue3}
            else if (fingerSelected == ringP1){ringP1 = blue3}
            else if (fingerSelected == ringP2){ringP2 = blue3}
        }
    }
    @IBAction func blue4Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        blueCounter+=1
        if(!(colorSelected == "blue")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = blue4}
            else if(fingerSelected == thumbP2){thumbP2 = blue4}
            else if (fingerSelected == indexP1){indexP1 = blue4}
            else if (fingerSelected == indexP2){indexP2 = blue4}
            else if (fingerSelected == middleP1){middleP1 = blue4}
            else if (fingerSelected == middleP2){middleP2 = blue4}
            else if (fingerSelected == ringP1){ringP1 = blue4}
            else if (fingerSelected == ringP2){ringP2 = blue4}
        }
    }
    
    
    @IBAction func red1Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        redCounter+=1
        if(!(colorSelected == "red")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = red1}
            else if(fingerSelected == thumbP2){thumbP2 = red1}
            else if (fingerSelected == indexP1){indexP1 = red1}
            else if (fingerSelected == indexP2){indexP2 = red1}
            else if (fingerSelected == middleP1){middleP1 = red1}
            else if (fingerSelected == middleP2){middleP2 = red1}
            else if (fingerSelected == ringP1){ringP1 = red1}
            else if (fingerSelected == ringP2){ringP2 = red1}
        }
    }
    @IBAction func red2Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        redCounter+=1
        if(!(colorSelected == "red")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = red2}
            else if(fingerSelected == thumbP2){thumbP2 = red2}
            else if (fingerSelected == indexP1){indexP1 = red2}
            else if (fingerSelected == indexP2){indexP2 = red2}
            else if (fingerSelected == middleP1){middleP1 = red2}
            else if (fingerSelected == middleP2){middleP2 = red2}
            else if (fingerSelected == ringP1){ringP1 = red2}
            else if (fingerSelected == ringP2){ringP2 = red2}
        }
    }
    @IBAction func red3Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        redCounter+=1
        if(!(colorSelected == "red")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = red3}
            else if(fingerSelected == thumbP2){thumbP2 = red3}
            else if (fingerSelected == indexP1){indexP1 = red3}
            else if (fingerSelected == indexP2){indexP2 = red3}
            else if (fingerSelected == middleP1){middleP1 = red3}
            else if (fingerSelected == middleP2){middleP2 = red3}
            else if (fingerSelected == ringP1){ringP1 = red3}
            else if (fingerSelected == ringP2){ringP2 = red3}
        }
    }
    @IBAction func red4Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        redCounter+=1
        if(!(colorSelected == "red")){
            lose()
            if(player1turn){loseMessage.text = player2Name+" Wins!"}
            if(player2turn){loseMessage.text = player1Name+" Wins!"}
        }
        else{
            if(fingerSelected == thumbP1){thumbP1 = red4}
            else if(fingerSelected == thumbP2){thumbP2 = red4}
            else if (fingerSelected == indexP1){indexP1 = red4}
            else if (fingerSelected == indexP2){indexP2 = red4}
            else if (fingerSelected == middleP1){middleP1 = red4}
            else if (fingerSelected == middleP2){middleP2 = red4}
            else if (fingerSelected == ringP1){ringP1 = red4}
            else if (fingerSelected == ringP2){ringP2 = red4}
        }
    }
    
    
    func isP1finger(finger: UIButton) -> Bool{
        let a = finger
        if (a == indexP1 || a == thumbP1 || a == middleP1 || a == ringP1){
            return true;
        }
        else{return false;}
    }
    
    //Search: Up Button
    @IBAction func green1(_ sender: UIButton) {
        if(!(fingerSelected == green1))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
                
            }
        }
        else{
            fingerSelected = UIButton()
            greenCounter-=1
        }
    }
    
    @IBAction func green2(_ sender: UIButton) {
        if(!(fingerSelected == green2))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            greenCounter-=1
        }
    }
    @IBAction func green3(_ sender: UIButton) {
        if(!(fingerSelected == green3))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            greenCounter-=1
        }
    }
    @IBAction func green4(_ sender: UIButton) {
        if(!(fingerSelected == green1))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            greenCounter-=1
        }
    }
    
    
    @IBAction func yellow1(_ sender: UIButton) {
        if(!(fingerSelected == yellow1))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            yellowCounter-=1
        }
    }
    @IBAction func yellow2(_ sender: UIButton) {
        if(!(fingerSelected == yellow2))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            yellowCounter-=1
        }
    }
    @IBAction func yellow3(_ sender: UIButton) {
        if(!(fingerSelected == yellow3))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            yellowCounter-=1
        }
    }
    @IBAction func yellow4(_ sender: UIButton) {
        if(!(fingerSelected == yellow4))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            yellowCounter-=1
        }
    }
    
    
    @IBAction func blue1(_ sender: UIButton) {
        if(!(fingerSelected == blue1))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            blueCounter-=1
        }
    }
    @IBAction func blue2(_ sender: UIButton) {
        if(!(fingerSelected == blue2))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            blueCounter-=1
        }
    }
    @IBAction func blue3(_ sender: UIButton) {
        if(!(fingerSelected == blue3))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            blueCounter-=1
        }
    }
    @IBAction func blue4(_ sender: UIButton) {
        if(!(fingerSelected == blue4))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            blueCounter-=1
        }
    }
    
    
    @IBAction func red1(_ sender: UIButton) {
        if(!(fingerSelected == red1))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            redCounter-=1
        }
    }
    @IBAction func red2(_ sender: UIButton) {
        if(!(fingerSelected == red2))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            redCounter-=1
        }
    }
    @IBAction func red3(_ sender: UIButton) {
        if(!(fingerSelected == red3))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            redCounter-=1
        }
    }
    @IBAction func red4(_ sender: UIButton) {
        if(!(fingerSelected == red4))
        {
            if(!lost){
                playButton.isEnabled = true
                playButton.isHighlighted = false
                lose()
                if(isP1finger(finger: fingerSelected)){loseMessage.text = player2Name+" Wins!"}
                if(!isP1finger(finger: fingerSelected)){loseMessage.text = player1Name+"Wins!"}
            }
        }
        else{
            fingerSelected = UIButton()
            redCounter-=1
        }
    }
}
