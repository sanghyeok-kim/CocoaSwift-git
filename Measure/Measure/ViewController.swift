//
//  ViewController.swift
//  Measure
//
//  Created by 김상혁 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBAction func convertButton(_ sender: Any) {
        
        guard let userInputText = inputTextField.text, userInputText.count > 0 else {
            return
        }
        
        guard let userInputNumber = Double(userInputText) else {
            return
        }
        
        let userMeters = Measurement(value: userInputNumber, unit: UnitLength.centimeters)
        
        let calculatedResult = userMeters.converted(to: UnitLength.inches)
        
        let result = String(format: "%.2lf inch", calculatedResult.value)
        
        outputLabel.text = result
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

