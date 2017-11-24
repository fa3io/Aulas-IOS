//
//  CalculatorManager.swift
//  helloword
//
//  Created by Aloc SP08609 on 22/11/2017.
//  Copyright © 2017 Aloc SP08609. All rights reserved.
//

import Foundation

/* */
struct CalculatorManager {
    
    enum Operation {
        case unaryOperation((Double)->Double)
        case binaryOperation((Double,Double)->Double)
        case perc((Double,Double)->Double)
        case equal
        case unknown
    }
    
    private struct PreviousBinaryOperation{
        let function:(Double,Double)->Double
        let firstOperand: Double
        
        func perform(with secondOperand:Double)->Double{
            return function(firstOperand, secondOperand)
        }
    }
    
    private var acumulator : Double  = 0.0
    private var binaryOperationMemory:PreviousBinaryOperation?

    private let operations = [
        "+":Operation.binaryOperation({$0+$1}),
        "–":Operation.binaryOperation({$0-$1}),
        "⨉":Operation.binaryOperation({$0*$1}),
        "÷":Operation.binaryOperation({$0/$1}),
        "±":Operation.unaryOperation(({$0 == 0 ? 0.0 : -$0})),
        "√":Operation.unaryOperation(sqrt),
        "%":Operation.perc({$0*($1/100)}),
        "=":Operation.equal
    ]
    var result :Double {
        get {
            return self.acumulator
        }
    }
    
    mutating func performOperation(_ symbol:String){
        guard let operation = operations[symbol] else{
            return
        }
        
        switch operation {
        case Operation.unaryOperation(let op):
           acumulator = op(acumulator)
        case Operation.binaryOperation(let op):
            binaryOperationMemory = PreviousBinaryOperation(function:op, firstOperand:acumulator)
    
        case Operation.perc(let op):
            var padrao = 1.0
            if let previousOp = binaryOperationMemory{
                padrao = previousOp.firstOperand
            }
            self.acumulator = op(padrao,self.acumulator)
        
        case Operation.equal:
            doPreviousBinaryOperation()
        default:
            break
        }
    }
    
    mutating func doPreviousBinaryOperation(){
        guard let memory = binaryOperationMemory else {return}
        self.acumulator = memory.perform(with:acumulator)
        binaryOperationMemory = nil
    }
    
    mutating func setOperand(_ operand:Double){
        acumulator = operand
    }
    
    mutating func clearMemory(){
        self.binaryOperationMemory = nil
    }
    
    mutating func clearAcumulator(){
        self.acumulator = 0.0
    }

}

