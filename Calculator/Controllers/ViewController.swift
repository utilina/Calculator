//
//  ViewController.swift
//  Calculator
//
//  Created by Анастасия Улитина on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot conver display label text to a Double!")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result =  calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            
            if isFinishTypingNumber {
                displayLabel.text! = numValue
                isFinishTypingNumber = false
            } else {
                
                if  numValue == "." {
                
                    let isInt = floor(displayValue) == displayValue
//                    print(floor(displayValue))
//                    print(isInt)
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += numValue
            }
            
        }
    
    }
    

}

