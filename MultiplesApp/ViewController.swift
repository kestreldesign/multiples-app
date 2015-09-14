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
    
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var multiplesLogo: UIImageView!
    @IBOutlet weak var tickButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sumsTextLabel: UILabel!
    
    @IBAction func startTheMultiplying(sender: AnyObject) {
        currentNumber = 0;

        //check input
        userInputNumber = getUserInput()!
        
        if userInputNumber != 0 {
            
            //hide the tick button, textbox and logo
            tickButton.hidden = true
            textField.hidden = true
            multiplesLogo.hidden = true
            
            //show the add button and text
            sumsTextLabel.hidden = false;
            addButton.hidden = false;
            
            //do the first sum
            doTheSum()
            
            //unhide the label
            sumsTextLabel.hidden = false
            
        } else {
            //error message for bad input (string, null or 0)
            textField.text = nil
            textField.placeholder = "enter a nonzero whole number"
        }
        
    }
    
    @IBAction func addAnotherOne(sender: AnyObject) {
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

