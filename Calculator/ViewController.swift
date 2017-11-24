//
//  ViewController.swift
//  Calculator
//
//  Created by Rafagan Abreu on 13/11/17.
//  Copyright © 2017 CINQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var userIsTyping: Bool = false
    var manager = CalculatorManager()
    
    @IBOutlet weak var buttonAc: UIButton!
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchClear(_ sender: UIButton) {
        userIsTyping = false
        display.text = "0"
        
        let digit = sender.currentTitle
        
        if digit == "C" {
            sender.setTitle("AC", for: .normal)
            manager.clearAcumulator()
        }else{
            sender.setTitle("C", for: .normal)
            manager.clearAcumulator()
            manager.clearMemory()
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            let textDisplay = display.text ?? ""
            display.text = textDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
            buttonAc.setTitle("C", for: .normal)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userIsTyping{
            userIsTyping = false
            manager.setOperand(displayValue)
        }
        
        if let mathSymbol = sender.currentTitle{
            manager.performOperation(mathSymbol)
        }
        
        displayValue = self.manager.result
        
    }
}
