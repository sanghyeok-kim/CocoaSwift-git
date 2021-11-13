//
//  Mission2_PasswdValidator.swift
//  Week2-01-MON-2DArr_MBJ_PasswdCheck_
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func validateID(id: String) -> Bool {
    
    let idCharSet = CharacterSet(charactersIn: id)
    
    let onlyEnglish = CharacterSet(charactersIn: "a"..."z").union(CharacterSet(charactersIn: "A"..."Z"))
    let onlyNumeric = CharacterSet.decimalDigits

    let idCondition = CharacterSet(charactersIn: "-").union(onlyEnglish).union(onlyNumeric)



    if id.count < 5 || id.count >= 24 {
        return false
    }

    else if !idCharSet.isSubset(of: idCondition) {
        return false
    }
    
    else if isDuplicated(input: id) {
        return false
    }
    
    else if isConsecutive(input: id) {
        return false
    }
    
    else {
        return true
    }
    
}


func isDuplicated (input: String) -> Bool {

    let numbersInStr = input.map{ String($0) }.map{ Int($0) }

    var numbers = [Int]()

    for i in numbersInStr {
        guard let n = i else {
            numbers.removeAll()
            continue
        }
        
        numbers.append(n)
        
        if numbers.count >= 3 {
            
            if numbers[0] == numbers[1] &&
                numbers[1] == numbers[2] {
                print("같은 세 숫자")
                return true
            } else {
                numbers.remove(at: 0)
            }
        }
    }
    return false
}


func isConsecutive (input: String) -> Bool {

    let numbersInStr = input.map{ String($0) }.map{ Int($0) }

    var numbers = [Int]()

    for i in numbersInStr {
        guard let n = i else {
            numbers.removeAll()
            continue
        }
        
        numbers.append(n)
        
        if numbers.count >= 3 {
            
            if numbers[0] + 1 == numbers[1] &&
                numbers[1] + 1 == numbers[2] {
                print("연속된 세 숫자")
                return true
            } else {
                numbers.remove(at: 0)
            }
            
        }
    }
    return false
}
