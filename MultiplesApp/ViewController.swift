//
//  ViewController.swift
//  MultiplesApp
//
//  Created by The Deblings on 14/09/2015.
//  Copyright © 2015 Kestrel Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //variables
    var userInputNumber = 0;
    let neverExceedNumber = 60;
    var currentNumber = 0;
    
    //outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var multiplesLogo: UIImageView!
    @IBOutlet weak var tickButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sumsTextLabel: UILabel!
    
    //begin the 'game' action function
    @IBAction func startTheMultiplying(sender: AnyObject) {
        currentNumber = 0; //reset in case the 'gmae' is played more than once

        //check input
        userInputNumber = getUserInput()!
        
        if userInputNumber != 0 {
            
            //do the first sum
            doTheSum()
            
            //show and hide relevant objects
            playTheGame(true)
            
        } else {
            //error message for bad input (string, null or 0)
            textField.text = nil
            textField.placeholder = "enter a nonzero whole number"
        }
        
    }
    
    func playTheGame(play :Bool){
        
        //if playing, hide the tick button, textbox and logo
        tickButton.hidden = play
        textField.hidden = play
        multiplesLogo.hidden = play
        
        //if playing, unhide the label and add button
        sumsTextLabel.hidden = !play
        addButton.hidden = !play
        
        if !play {
            textField.text = nil
            textField.placeholder = "what multiple to add by?"
        }
    }
    
    @IBAction func addAnotherOne(sender: AnyObject) {
        doTheSum();
        
        //if the currentNumber is now over our maximum, end the 'game'
        if currentNumber >= neverExceedNumber {
            playTheGame(false)
        }
    }
    
    func getUserInput() ->Int? {
        let theNumber: Int? = Int((textField.text!))
        
        if (theNumber != nil) {
            return theNumber
        } else {
            return 0
        }
    }
    
    func doTheSum(){
        let newTotal = currentNumber + userInputNumber
        
        //change the label to the new formula
        sumsTextLabel.text = "\(currentNumber) + \(userInputNumber) = \(newTotal)"
        
        //change the currentNumber to the newTotal
        currentNumber = newTotal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

