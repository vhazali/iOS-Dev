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

    var isTyping : Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if(isTyping) {
            currDigitDisplay.text = currDigitDisplay.text! + digit
        } else {
            currDigitDisplay.text=digit
            isTyping = true
        }
        
        
        print("digit = \(digit)")
    }
}