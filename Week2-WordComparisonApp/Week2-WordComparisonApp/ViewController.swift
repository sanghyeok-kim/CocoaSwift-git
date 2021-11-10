//
//  ViewController.swift
//  Week2-WordComparisonApp
//
//  Created by 김상혁 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {
    
    
    var words = ["동해물과", "백두산이", "마르고", "닳도록", "하느님이", "보우하사", "우리나라", "만세", "무궁화", "삼천리"]
    var count = 0
    
    @IBOutlet weak var nowWord: UILabel!
    
    @IBOutlet weak var nextWord: UILabel!
    
    @IBOutlet weak var inputText: UITextField!
    
    
    
    @IBAction func button(_ sender: Any) {
        
        guard let input = inputText.text, input.count > 0 else {
            return
        }
        
        if input == words[count] {
            nowWord.textColor = UIColor.black
            nextWord.textColor = UIColor.black
            
            count += 1
            if count == words.count {
                nowWord.text = "! clear !"
                inputText.text = ""
                return
            }
            else {
                nowWord.text = words[count]
            }
            
            if count == words.count - 1 {
                nextWord.text = ""
            } else {
                nextWord.text = words[count + 1]
            }
            inputText.text = ""
            
        }
        
        else {
            nowWord.textColor = UIColor.red
            nextWord.textColor = UIColor.red
            
            inputText.text = ""
            return
        }
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        words.shuffle()
        nowWord.text = words[0]
        nextWord.text = words[1]
    
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    

        // Do any additional setup after loading the view
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

