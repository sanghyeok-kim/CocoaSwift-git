//
//  ViewController.swift
//  Week2-PasswordApp
//
//  Created by 김상혁 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var levelView: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func passwordValidator(password: String) -> Int {
        let passwordSet = CharacterSet(charactersIn: password)
        
        let onlyEnglish = CharacterSet(charactersIn: "a"..."z").union(CharacterSet(charactersIn: "A"..."Z"))

        let onlyNumeric = CharacterSet.decimalDigits

        let onlyEnglishAndNumeric = onlyEnglish.union(onlyNumeric)

        let specialCharacters = CharacterSet(charactersIn: "-+!@#$%")


        //최소 1개 이상의 특수문자(-+!@#%) & 최소 1개 이상의 영문자 & 최소 1개 이상의 숫자 & 8자 이상
        if !passwordSet.isDisjoint(with: specialCharacters) &&
            !passwordSet.isDisjoint(with: onlyEnglish) &&
            !passwordSet.isDisjoint(with: onlyNumeric) &&
             password.count >= 8 {
            return 5
        }

        //최소 1개 이상의 영문자 & 최소 1개 이상의 숫자 & 영문자와 숫자로만 구성 & 8자 이상
        else if !passwordSet.isDisjoint(with: onlyEnglish) &&
                    !passwordSet.isDisjoint(with: onlyNumeric) &&
                    passwordSet.isSubset(of: onlyEnglishAndNumeric) &&
                    password.count >= 8 {
            return 4
        }

        //영문자로만 구성 & 8자 미만
        else if passwordSet.isSubset(of: onlyEnglish) && password.count < 8 {
            return 2
        }

        //숫자로만 구성 & 8자 미만
        else if passwordSet.isSubset(of: onlyNumeric) && password.count < 8 {
            return 1
        }

        //그 외
        else {
            return 3
        }
    }
    
    
    func changeLabelBarColor(level: Int) {
        switch level {
        case 1:
            levelView.backgroundColor = UIColor.red
            descriptionLabel.text = "아주 약한 암호"
        case 2:
            levelView.backgroundColor = UIColor.orange
            descriptionLabel.text = "약한 암호"
        case 3:
            levelView.backgroundColor = UIColor.yellow
            descriptionLabel.text = "보통 암호"
        case 4:
            levelView.backgroundColor = UIColor.blue
            descriptionLabel.text = "강한 암호"
        case 5:
            levelView.backgroundColor = UIColor.green
            descriptionLabel.text = "아주 강한 암호"
        default:
            levelView.backgroundColor = UIColor.opaqueSeparator
            descriptionLabel.text = "암호 수준"
        }
    }

    
    
    

    @IBAction func button(_ sender: Any) {
        guard let input = passwordInput.text, input.count > 0 else {
            return
        }
        
        
        
        let passwordLevel = passwordValidator(password: input)
        
        changeLabelBarColor(level: passwordLevel)
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

