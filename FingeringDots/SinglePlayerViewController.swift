//
//  ViewController.swift
//  FingeringDots
//
//  Version 1.1
//  Created by Carolina I. Brager on 2/25/17.
//  Copyright © 2017 Carolina I. Brager. All rights reserved.
//

import UIKit

class SinglePlayerViewController: UIViewController {
    
    
    
    @IBOutlet weak var green: UIImageView!
    @IBOutlet weak var yellow: UIImageView!
    @IBOutlet weak var blue: UIImageView!
    @IBOutlet weak var red: UIImageView!
    @IBOutlet weak var greyBar: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var loseMessage: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var scoreKeeper: UILabel!
    
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
    
    
    var thumb = UIButton()
    var index = UIButton()
    var pointer = UIButton()
    var middle = UIButton()
    var ring = UIButton()
    
    var greenCounter = 0;
    var yellowCounter = 0;
    var blueCounter = 0;
    var redCounter = 0;
    
    var scoreCounter = 0;
    
    var lost = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add borders to play and home buttons
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var colorSelected = String()
    
    var fingerSelected = UIButton()
    
    var played = false
    
    
    
    @IBAction func play(_ sender: UIButton) {
        loseMessage.text = " "
        playButton.setTitle("Spin", for: .normal)
        lost = false
        var random = Int(arc4random_uniform(4)+12)
        var i = 0;
        //randomly choose a color (attempts to animate are currently not working)
        while(i < random){
            if(i%4 == 0){
                if(greenCounter >= 3){i+=i
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
                if(yellowCounter >= 3){i+=i
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
                if(blueCounter >= 3){
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
                if(redCounter >= 3){i+=i
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
        //randomly choose a finger
        let random2 = Int(arc4random_uniform(4))
            if(random2 % 4 == 0){
                fingerSelected = thumb
                greyBar.setTitle("Thumb", for: .normal)
            }
            if(random2 % 4 == 1){
                fingerSelected = index
                greyBar.setTitle("Index", for: .normal)
            }
            if(random2 % 4 == 2){
                fingerSelected = middle
                greyBar.setTitle("Middle", for: .normal)
            }
            if(random2 % 4 == 3){
                fingerSelected = ring
                greyBar.setTitle("Ring", for: .normal)
            }
        
        playButton.isEnabled = false
        playButton.isHighlighted = true
    }
    
    
    //reset everything when you loose. Print "You Loose"
    func lose(){
        loseMessage.text = "You Lose. Final Score:" + String(scoreCounter)
        scoreKeeper.text = " "
        lost = true;
        thumb = UIButton()
        index = UIButton()
        pointer = UIButton()
        middle = UIButton()
        ring = UIButton()
        green.image = #imageLiteral(resourceName: "GreenNS")
        yellow.image = #imageLiteral(resourceName: "YellowNS")
        blue.image = #imageLiteral(resourceName: "BlueNS")
        red.image = #imageLiteral(resourceName: "RedNS")
        greyBar.setTitle("", for: .normal)
        playButton.setTitle("Play", for: .normal)
        greenCounter = 0
        yellowCounter = 0
        blueCounter = 0
        redCounter = 0
        scoreCounter = 0
    }
    
    //Search: Down Button
    /*Each of these functions represent one of the dots of twister. The buttons
     check to see if they are being pressed at the right time. AKA when their color
     has been selected. If not, then you loose. If yes, then you score a point and 
     the current button is stored to the current finger.
     */
    
    @IBAction func green1Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        greenCounter+=1
        if(!(colorSelected == "green")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = green1
        }
    }
    @IBAction func green2Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        greenCounter+=1
        if(!(colorSelected == "green")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = green2
        }
    }
    @IBAction func green3Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        greenCounter+=1
        if(!(colorSelected == "green")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = green3
        }
    }
    @IBAction func green4Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        greenCounter+=1
        if(!(colorSelected == "green")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = green4
        }
    }
    @IBAction func yellow1Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        yellowCounter+=1
        if(!(colorSelected == "yellow")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = yellow1
        }
    }
    @IBAction func yellow2Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        yellowCounter+=1
        if(!(colorSelected == "yellow")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = yellow2
        }
    }
    @IBAction func yellow3Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        yellowCounter+=1
        if(!(colorSelected == "yellow")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = yellow3
        }
    }
    @IBAction func yellow4Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        yellowCounter+=1
        if(!(colorSelected == "yellow")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = yellow4
        }
    }
    @IBAction func blue1Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        blueCounter+=1
        if(!(colorSelected == "blue")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = blue1
        }
    }
    @IBAction func blue2Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        blueCounter+=1
        if(!(colorSelected == "blue")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = blue2
        }
    }
    @IBAction func blue3Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        blueCounter+=1
        if(!(colorSelected == "blue")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = blue3
        }
    }
    @IBAction func blue4Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        blueCounter+=1
        if(!(colorSelected == "blue")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = blue4
        }
    }
    @IBAction func red1Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        redCounter+=1
        if(!(colorSelected == "red")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = red1
        }
    }
    @IBAction func red2Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        redCounter+=1
        if(!(colorSelected == "red")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = red2
        }
    }
    @IBAction func red3Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        redCounter+=1
        if(!(colorSelected == "red")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = red3
        }
    }
    @IBAction func red4Down(_ sender: UIButton) {
        playButton.isEnabled = true
        playButton.isHighlighted = false
        redCounter+=1
        if(!(colorSelected == "red")){
            lose()
        }
        else{
            scoreCounter+=1
            scoreKeeper.text = String(scoreCounter)
            fingerSelected = red4
        }
    }
    
    //Search: Up Button
    /*These functions run when a finger is lifted or dragged off of a button. It first checks if
     that action is allowed (aka if that finger has been selected). If it isn't then you loose. If it is,
     the current finger is set to a standard UIButton (aka not storing a value) and the number of green's 
     on the board decrements by one*/
    @IBAction func green1(_ sender: UIButton) {
        if(!(fingerSelected == green1))
            {
                if(!lost){
                    playButton.isEnabled = true
                    playButton.isHighlighted = false
                    lose()
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
            }
        }
        else{
            fingerSelected = UIButton()
            redCounter-=1
        }
    }
}

