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
    @IBOutlet var hours: [UILabel]!
    @IBOutlet var minutes: [UILabel]!
    @IBOutlet var tenMinutes: [UILabel]!
    
    @IBOutlet weak var jeon: UILabel!
    @IBOutlet weak var who: UILabel!
    @IBOutlet weak var sky: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    let seconds = ["정각", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
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
            hours[14].textColor = .white
        }
        
        let hourUnit = hour > 12 ? hour - 12 : hour
        switch hourUnit {
        case 0:
            hours[0].textColor = .white
        case 1:
            hours[1].textColor = .white
        case 2:
            hours[2].textColor = .white
        case 3:
            hours[3].textColor = .white
        case 4:
            hours[4].textColor = .white
        case 5:
            hours[5].textColor = .white
            hours[7].textColor = .white
        case 6:
            hours[6].textColor = .white
            hours[7].textColor = .white
        case 7:
            hours[8].textColor = .white
            hours[9].textColor = .white
        case 8:
            hours[10].textColor = .white
            hours[11].textColor = .white
        case 9:
            hours[12].textColor = .white
            hours[13].textColor = .white
        default:
            return
        }
        
 
        //분
        if minute >= 10 {
            tenMinutes[0].textColor = .white
            
            if minute >= 50 {
                tenMinutes[4].textColor = .white
            }
            else if minute >= 40 {
                tenMinutes[3].textColor = .white
            }
            else if minute >= 30 {
                tenMinutes[2].textColor = .white
            }
            else if minute >= 20 {
                tenMinutes[1].textColor = .white
            }
        }
        
        let minuteUnit = minute % 10
        if minuteUnit == 1 {
            minutes[0].textColor = .white
        }
        else if minuteUnit == 2 {
            minutes[1].textColor = .white
        }
        else if minuteUnit == 3 {
            minutes[2].textColor = .white
        }
        else if minuteUnit == 4 {
            minutes[3].textColor = .white
        }
        else if minuteUnit == 5 {
            minutes[4].textColor = .white
        }
        else if minuteUnit == 6 {
            minutes[5].textColor = .white
        }
        else if minuteUnit == 7 {
            minutes[6].textColor = .white
        }
        else if minuteUnit == 8 {
            minutes[7].textColor = .white
        }
        else if minuteUnit == 9 {
            minutes[8].textColor = .white
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



