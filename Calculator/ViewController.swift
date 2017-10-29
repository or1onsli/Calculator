//
//  ViewController.swift
//  Calculator
//
//  Created by Andrea Vultaggio on 17/10/2017.
//  Copyright © 2017 Andrea Vultaggio. All rights reserved.
//

import UIKit
import DeviceKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var sequence: UILabel!
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var display: UILabel!
    
    //MARK: Variables
    
    private var brain = CalculatorBrain()
    private var userIsInTheMiddleOfTyping = false
    
    var iPhoneModel: Device {
        get {
            return Device()
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            let tmp = String(newValue).removeAfterPointIfZero()
            display.text = tmp.setMaxLength(of: 8)
        }
    }
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    //MARK: UIVIew Delegate
    
    override func viewDidLoad() {
        
        // round the corners of the calculator on iPhone X
        if iPhoneModel == .iPhoneX || iPhoneModel == .simulator(.iPhoneX){
            cornerView.layer.cornerRadius = 35
            cornerView.layer.masksToBounds = true
        } 
    }
    
    //MARK: IBAction(s)
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            
            if digit == "." && (textCurrentlyInDisplay.range(of: ".") != nil) {
                return
            } else {
                let tmp = textCurrentlyInDisplay + digit
                display.text = tmp.setMaxLength(of: 8)
            }
            
        } else {
            if digit == "." {
                display.text = "0."
            } else {
                display.text = digit
            }
            userIsInTheMiddleOfTyping = true
        }
        
        sequence.text = brain.description
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
        
        sequence.text = brain.description
    }
}

