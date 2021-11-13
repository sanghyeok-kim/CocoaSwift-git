//
//  mission1-이자율계산구조체.swift
//  Week2-WED
//
//  Created by 김상혁 on 2021/11/10.
//

struct InterestRate {
    

    
    func getInterestRate(byDay: Int) -> Double {
        
        switch byDay {
        case ...90:
            return 0.005
        case 91...180:
            return 0.01
        case 181...364:
            return 0.02
        case 365...:
            return 0.056
        default:
            return 0
        }
    }
        
    func calculateAmount(day: Int , amount: Int) -> Double {
        
        let interestRate = getInterestRate(byDay: day)
        let result = Double(amount) + Double(amount) * interestRate

        return result
    }
    
    func testInterest(unitDay: Int) -> Double {
        
        for i in 1...365 {
            if i % unitDay == 0 {
                let result = calculateAmount(day: i, amount: 1_000_000)
                print("\(i)일차에 받을 수 있는 원리금 : \(Int(result))원")
            }
        }
        return 0
    }
}

