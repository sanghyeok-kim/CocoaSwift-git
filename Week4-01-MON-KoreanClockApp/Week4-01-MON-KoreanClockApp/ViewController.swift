//
//  ViewController.swift
//  Week4-01-MON-KoreanClockApp
//
//  Created by 김상혁 on 2021/11/22.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
    
    @IBOutlet var labels: [UILabel]!
    
    //Outlet Collection에 대해 알았으니 다음부터는 이렇게 Label을 하나하나 하지말고 Collection을 쓰자 !!!
    
    //switch문은 모든 경우의 수를 다 case로 처리할 경우에만 사용하자 - 0의 경우를 처리하지 않아서, default가 실행되어 원치않은 결과가 실행됨
    
    @IBOutlet weak var jeon: UILabel!
    @IBOutlet weak var who: UILabel!
    
    @IBOutlet weak var young: UILabel!
    @IBOutlet weak var yeol: UILabel!
    
    @IBOutlet weak var han: UILabel!
    @IBOutlet weak var `do`: UILabel!
    @IBOutlet weak var se: UILabel!
    @IBOutlet weak var ne: UILabel!
    @IBOutlet weak var da: UILabel!
    @IBOutlet weak var yeo: UILabel!
    @IBOutlet weak var sut: UILabel!
    @IBOutlet weak var il: UILabel!
    @IBOutlet weak var gop: UILabel!
    @IBOutlet weak var yeo2: UILabel!
    @IBOutlet weak var dulb: UILabel!
    @IBOutlet weak var ah: UILabel!
    @IBOutlet weak var hop: UILabel!
    
    @IBOutlet weak var ilbun: UILabel!
    @IBOutlet weak var ebun: UILabel!
    @IBOutlet weak var sambun: UILabel!
    @IBOutlet weak var sabun: UILabel!
    @IBOutlet weak var obun: UILabel!
    @IBOutlet weak var yukbun: UILabel!
    @IBOutlet weak var chillbun: UILabel!
    @IBOutlet weak var palbun: UILabel!
    @IBOutlet weak var gubun: UILabel!
    
    @IBOutlet weak var ship: UILabel!
    @IBOutlet weak var eship: UILabel!
    @IBOutlet weak var samship: UILabel!
    @IBOutlet weak var saship: UILabel!
    @IBOutlet weak var oship: UILabel!
    
    @IBOutlet weak var sky: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    let seconds = ["정각", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구",]
    let secondUnits = ["십", "이십", "삼십", "사십", "오십"]
    
    func setAllLabelGray() {
        for label in labels {
            label.textColor = .gray
        }
    }
    
    func displayClock() {
        let now = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: now)
        let minute = calendar.component(.minute, from: now)
        let second = calendar.component(.second, from: now)
        
        
        //오전 / 오후
        if hour >= 12 {
            who.textColor = .white
            
        } else {
            jeon.textColor = .white
        }
        
        
        //해 / 달
        if hour >= 7 && hour <= 19 {
            sky.text = "☀️"
        } else {
            sky.text = "🌙"
        }
        
        
        //시
        let yeolHours = [10, 11, 12, 22, 23]
        if yeolHours.contains(hour) {
            yeol.textColor = .white
            
            if hour % 10 == 1 {
                han.textColor = .white
            }
            else if hour % 10 == 2 {
                `do`.textColor = .white
            }
            if hour % 10 == 3 {
                se.textColor = .white
            }
        }
        
        let hourUnit = hour > 12 ? hour - 12 : hour
        switch hourUnit {
        case 0:
            young.textColor = .white
        case 1:
            han.textColor = .white
        case 2:
            `do`.textColor = .white
        case 3:
            se.textColor = .white
        case 4:
            ne.textColor = .white
        case 5:
            da.textColor = .white
        case 6:
            yeo.textColor = .white
            sut.textColor = .white
        case 7:
            il.textColor = .white
            gop.textColor = .white
        case 8:
            yeo2.textColor = .white
            dulb.textColor = .white
        case 9:
            ah.textColor = .white
            hop.textColor = .white
        default:
            return
        }
        
 
        //분
        if minute >= 10 {
            ship.textColor = .white
            
            if minute >= 50 {
                oship.textColor = .white
            }
            else if minute >= 40 {
                saship.textColor = .white
            }
            else if minute >= 30 {
                samship.textColor = .white
            }
            else if minute >= 20 {
                eship.textColor = .white
            }
        }
        
        let minuteUnit = minute % 10
        if minuteUnit == 1 {
            ilbun.textColor = .white
        }
        else if minuteUnit == 2 {
            ebun.textColor = .white
        }
        else if minuteUnit == 3 {
            sambun.textColor = .white
        }
        else if minuteUnit == 4 {
            sabun.textColor = .white
        }
        else if minuteUnit == 5 {
            obun.textColor = .white
        }
        else if minuteUnit == 6 {
            yukbun.textColor = .white
        }
        else if minuteUnit == 7 {
            chillbun.textColor = .white
        }
        else if minuteUnit == 8 {
            palbun.textColor = .white
        }
        else if minuteUnit == 9 {
            gubun.textColor = .white
        }
        
        
        //초
        var secondText = ""
        if second == 0 {
            secondLabel.text = seconds[0]
            return
        }
        
        if second >= 50 {
            secondText.append(secondUnits[4])
        }
        else if second >= 40 {
            secondText.append(secondUnits[3])
        }
        else if second >= 30 {
            secondText.append(secondUnits[2]) 
        }
        else if second >= 20 {
            secondText.append(secondUnits[1])
        }
        else if second >= 10 {
            secondText.append(secondUnits[0])
        }
        
        secondText.append("\n")
        
        if second % 10 == 1 {
            secondText.append(seconds[1])
        }
        else if second % 10 == 2 {
            secondText.append(seconds[2])
        }
        else if second % 10 == 3 {
            secondText.append(seconds[3])
        }
        else if second % 10 == 4 {
            secondText.append(seconds[4])
        }
        else if second % 10 == 5 {
            secondText.append(seconds[5])
        }
        else if second % 10 == 6 {
            secondText.append(seconds[6])
        }
        else if second % 10 == 7 {
            secondText.append(seconds[7])
        }
        else if second % 10 == 8 {
            secondText.append(seconds[8])
        }
        else if second % 10 == 9 {
            secondText.append(seconds[9])
        }
        
        secondLabel.text = secondText + "초"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.setAllLabelGray()
            self.displayClock()
        }
    }
}



