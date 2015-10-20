//
//  ViewController.swift
//  Calculator
//
//  Created by Victor Hazali on 18/10/15.
//  Copyright © 2015 Victor Hazali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultDisplay: UILabel!
    @IBOutlet weak var operationDisplay: UILabel!
    @IBOutlet weak var currDigitDisplay: UILabel!

    var isTyping = false
    var brain = CalculatorController()
    
    //To dynamically access the curr display value
    var currDisplayValue:Double {
        get {
            return NSNumberFormatter().numberFromString(currDigitDisplay.text!)!.doubleValue
        }
        
        set{
            currDigitDisplay.text = "\(newValue)"
        }
    }
    
    var resDisplayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(resultDisplay.text!)!.doubleValue
        }
        set{
            resultDisplay.text = "\(newValue)"
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if(isTyping) {
            currDigitDisplay.text = currDigitDisplay.text! + digit
        } else {
            currDigitDisplay.text=digit
            isTyping = true
        }
    }
    
    @IBAction func finishAppend() {
        isTyping = false
        if let result = brain.pushOperand(currDisplayValue) {
            currDisplayValue = result
        } else {
            currDisplayValue = 0
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if isTyping {
            finishAppend()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                currDisplayValue = result
            } else {
                currDisplayValue = 0
            }
        }
    }
}