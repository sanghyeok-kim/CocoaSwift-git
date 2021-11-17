//
//  ViewController.swift
//  Week3-02-WED-CalculatorApp
//
//  Created by 김상혁 on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {

    var displayNumber = ""

    
    @IBOutlet weak var numberOutputLabel: UILabel!

 
    @IBAction func tapNumberBtn(_ sender: UIButton) {
        guard let number = sender.title(for: .normal) else { return }
    
        if self.displayNumber.count < 10 {
            self.displayNumber += number
            self.numberOutputLabel.text = self.displayNumber
        }
    
    }
    
    @IBAction func divideBtn(_ sender: Any) {
    }
    
    @IBAction func multiplyBtn(_ sender: Any) {
    }
    
    @IBAction func subtractBtn(_ sender: Any) {
    }
    
    @IBAction func eqaulBtn(_ sender: Any) {
    }
    
    @IBAction func plusBtn(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

