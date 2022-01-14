//
//  StringExtension.swift
//  Calculator
//
//  Created by Andrea Vultaggio on 24/10/2017.
//  Copyright © 2017 Andrea Vultaggio. All rights reserved.
//

import Foundation

/*
 * Useful functions for the manipulation of the strings (values) which we put on the calculator display.
 * Instead of using the NumberFormatter object I preferred to format the strings manually and make a simple exercise
 * on doing some extensions.
 */
 
 public extension String {
    
    // set the max length of the number to display
    func setMaxLength(of maxLength: Int) -> String {
        var tmp = self
        
        if tmp.count > maxLength {
            var numbers = tmp.map({$0})
            
            if numbers[maxLength - 1] == "." {
                numbers.removeSubrange(maxLength+1..<numbers.endIndex)
            } else {
                numbers.removeSubrange(maxLength..<numbers.endIndex)
            }
            
            tmp = String(numbers)
        }
        return tmp
    }
    
    // remove the '.0' when the number is not decimal
    func removeAfterPointIfZero() -> String {
        let token = self.components(separatedBy: ".")
        
        if !token.isEmpty && token.count == 2 {
            switch token[1] {
            case "0", "00", "000", "0000", "00000", "000000":
                return token[0]
            default:
                return self
            }
        }
        return self
    }
}
