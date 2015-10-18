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
    var operandStack = Array<Double>()
    
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
        
        
//        print("digit = \(digit)")
    }
    
    @IBAction func finishAppend() {
        isTyping = false
        operandStack.append(currDisplayValue)
        print("operandStack = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        operationDisplay.text = operation
        if isTyping {
            finishAppend()
        }
        switch operation {
        case "x" : performBinaryOperation({ (op1: Double, op2: Double) -> Double in
            return op1 * op2})
        case "÷" : performBinaryOperation({(op1,op2) in op2 / op1})
        case "+" : performBinaryOperation({$0 + $1})
        case "-" : performBinaryOperation {$1 - $0}
        case "√" : performUnaryOperation {sqrt($0)}
        default: break
        }
        print("operandStack = \(operandStack)")
    }
    
    func performBinaryOperation(operation: (Double,Double) -> Double) {
        if operandStack.count >= 2 {
            let res = operation(operandStack.removeLast(), operandStack.removeLast())
            operandStack.append(res)
            resDisplayValue = res
        }
    }
    func performUnaryOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            let res = operation(operandStack.removeLast())
            operandStack.append(res)
            resDisplayValue = res
        }
    }
}