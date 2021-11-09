//
//  ViewController.swift
//  Week2-Cafelatte
//
//  Created by 김상혁 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    let cafeLatteImage = UIImage(named: "cafe-latte.jpg")
    let greeanTeaImage = UIImage(named: "green-tea.jpg")
    
    @IBAction func menuButtonTouched(_ sender: Any) {
        
        if menuImageView.image == nil {
            menuImageView.image = cafeLatteImage
            titleLabel.text = "카페라떼"
        }
        else if menuImageView.image == greeanTeaImage {
            menuImageView.image = cafeLatteImage
            titleLabel.text = "카페라떼"
        }
        else {
            menuImageView.image = greeanTeaImage
            titleLabel.text = "그린티"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

