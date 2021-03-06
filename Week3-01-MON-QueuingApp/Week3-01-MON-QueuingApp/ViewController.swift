//
//  ViewController.swift
//  Mission4_QueuingApp
//
//  Created by κΉμν on 2021/11/15.
//

import UIKit

class ViewController: UIViewController {
    let MAX = 20
    let MIN = 0
    let progressUnit: Float = 1.0 / 20.0
    var queuingCount = 0
    
    func pressed(by btn: Bool) {
        if btn {
            queuingCount += 1
            progressBar.progress += progressUnit
        } else {
            queuingCount -= 1
            progressBar.progress -= progressUnit
        }
        
        countPersonLabel.text = String(format: "%02d λͺ", queuingCount)
    }
    
    @IBOutlet weak var countPersonLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var queueButtonOutlet: UIButton!
    
    @IBAction func queueButton(_ sender: Any) {
        pressed(by: true)
        
        if queuingCount == MAX {
            countPersonLabel.textColor = .red
            queueButtonOutlet.isEnabled = false
            return
        } else {
            doneButtonOutlet.isEnabled = true
        }
    }
    
    
    @IBOutlet weak var doneButtonOutlet: UIButton!
    @IBAction func doneButton(_ sender: Any) {
        pressed(by: false)
        
        if queuingCount == MIN {
            doneButtonOutlet.isEnabled = false
            progressBar.progress = 0
            return
        } else {
            countPersonLabel.textColor = .black
            queueButtonOutlet.isEnabled = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButtonOutlet.isEnabled = false
        progressBar.progress = 0.0
    }
}

