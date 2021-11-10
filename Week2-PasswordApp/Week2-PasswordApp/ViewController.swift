//
//  ViewController.swift
//  Week2-PasswordApp
//
//  Created by 김상혁 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var inputText: UITextField!
    
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    
    
    @IBAction func button(_ sender: Any) {
        guard let input = inputText.text, input.count > 0 else {
            return
        }
        outputLabel.text = input
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

