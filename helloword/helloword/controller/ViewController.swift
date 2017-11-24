//
//  ViewController.swift
//  helloword
//
//  Created by Aloc SP08609 on 21/11/2017.
//  Copyright © 2017 Aloc SP08609. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var displayDouble: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    var op : String = ""
    var  userIsTyping : Bool = false
    var number1 : Double = 0.0
    var number2 : Double = 0.0
    
    
    @IBAction func onTouchAC(_ sender: UIButton) {
        number1 = 0.0
        number2 = 0.0
        displayDouble = 0.0
        userIsTyping = false
    }
    
    @IBAction func onTouchButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
       
        if userIsTyping{
            let textDisplay = display.text ?? ""
            display.text = textDisplay + digit
        }else{
            display.text = digit
            userIsTyping = true
        }
    }
    
    @IBAction func maisOuMenos(_ sender: UIButton) {
        if displayDouble != 0.0{
            displayDouble = (displayDouble * (-1.0))
        }
    }
    
    @IBAction func raiz(_ sender: Any) {
          displayDouble = sqrt(displayDouble)
    }
    
    @IBAction func onTouchOperation(_ sender: UIButton) {
       
        let operation = sender.currentTitle!

        if number1 != 0.0{
            number2 = displayDouble
        }else{
            number1 = displayDouble
        }
        if op != "" {
            calcular()
        }
        op = operation
        userIsTyping = false
    
    }
    
     @IBAction func calcular(){
        switch op{
            case "÷":
                displayDouble = number1 / number2
            break
            case "X":
                displayDouble = number1 * number2
            break
            case "−":
                displayDouble = number1 - number2
            break
            case "+":
                displayDouble = number1 + number2
            break
            default:
            break
        }
    }
}




















