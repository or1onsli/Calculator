//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Andrea Vultaggio on 17/10/2017.
//  Copyright © 2017 Andrea Vultaggio. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    //MARK: Variables
    
    private var accumulator: Double?
    private var pendingBinaryOperation: PendingBinaryOperation?
    private var resultIsPending = false
    
    var description = ""
    var result: Double? { get { return accumulator } }
    
    //MARK: Enumerations
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case result
    }
    
    private var operations: Dictionary<String, Operation> = [
        "＋" : .binaryOperation({ $0 + $1 }),
        "﹣" : .binaryOperation({ $0 - $1 }),
         "×" : .binaryOperation({ $0 * $1 }),
         "÷" : .binaryOperation({ $0 / $1 }),
         "√" : .unaryOperation({ sqrt($0) }),
         "±" : .unaryOperation({ -$0 }),
         "﹪" : .unaryOperation({ $0 / 100 }),
         "AC": .constant(0),
         "=" : .result
    ]
    
    //MARK: Embedded struct

    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    //MARK: Functions
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation?.perform(with: accumulator!)
            pendingBinaryOperation = nil
            resultIsPending = false
        }
    }
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
                case .constant(let value):
                    accumulator = value
                    description = ""
                case .unaryOperation(let function):
                    if accumulator != nil {
                        let value = String(describing: accumulator!).removeAfterPointIfZero()
                        description = symbol + "(" + value.setMaxLength(of: 5) + ")" + "="
                        accumulator = function(accumulator!)
                    }
                case .binaryOperation(let function):
                    performPendingBinaryOperation()
                    
                    if accumulator != nil {
                        if description.last == "=" {
                            description = String(describing: accumulator!).removeAfterPointIfZero().setMaxLength(of: 5) + symbol
                        } else {
                            description += symbol
                        }
                        
                        pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                        resultIsPending = true
                        accumulator = nil
                    }
                case .result:
                    performPendingBinaryOperation()
                    
                    if !resultIsPending {
                        description += "="
                    }
            }
        }
    }
    
    mutating func setOperand(_ operand: Double?) {
        accumulator = operand ?? 0.0
        if !resultIsPending {
            description = String(describing: operand!).removeAfterPointIfZero().setMaxLength(of: 5)
        } else {
            description += String(describing: operand!).removeAfterPointIfZero().setMaxLength(of: 5)
        }
    }
}
