//
//  ViewController.swift
//  Calculator
//
//  Created by Анастасия Улитина on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishTypingNumber: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTypingNumber = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert string to a double")
        }
            if let calcMethod = sender.currentTitle {
                if calcMethod == "+/-" {
                    displayLabel.text = String(format:"%.0f", number * -1)
                } else if calcMethod == "AC" {
                    displayLabel.text = String(format:"%.0f", 0)
                } else if calcMethod == "%" {
                    displayLabel.text = String(number / 100)
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
                    guard let currentDisplayLabel = Double(displayLabel.text!) else { return }
                    let isInt = floor(currentDisplayLabel) == currentDisplayLabel
                    print(floor(currentDisplayLabel))
                    print(isInt)
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += numValue
            }
            
        }
    
    }
    

}

