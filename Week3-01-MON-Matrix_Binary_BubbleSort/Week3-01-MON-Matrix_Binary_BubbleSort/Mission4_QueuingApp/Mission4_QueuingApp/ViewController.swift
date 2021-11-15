//
//  ViewController.swift
//  Mission4_QueuingApp
//
//  Created by 김상혁 on 2021/11/15.
//

import UIKit

class ViewController: UIViewController {
    let MAX = 20
    let MIN = 0
    let progressUnit: Float = 1.0 / 20.0
    var queuingCount = 0
    
    @IBOutlet weak var countPersonLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var queueButtonOutlet: UIButton!
    
    @IBAction func queueButton(_ sender: Any) {
        queuingCount += 1
        countPersonLabel.text = String(format: "%02d 명", queuingCount)
        progressBar.progress += progressUnit
        
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
        queuingCount -= 1
        countPersonLabel.text = String(format: "%02d 명", queuingCount)
        progressBar.progress -= progressUnit
        
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

