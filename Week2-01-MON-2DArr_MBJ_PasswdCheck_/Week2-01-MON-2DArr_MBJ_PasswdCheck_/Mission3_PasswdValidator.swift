//
//  Mission3_PasswdValidaotr.swift
//  Week2-01-MON-2DArr_MBJ_PasswdCheck_
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func validatePassword(password: String) -> Int {

    let passwordCharSet = CharacterSet(charactersIn: password)
    
    let onlyEnglish = CharacterSet(charactersIn: "a"..."z").union(CharacterSet(charactersIn: "A"..."Z"))
    let onlyNumeric = CharacterSet.decimalDigits
    let specialCharacters = CharacterSet(charactersIn: "`~!@#$%^&*()_+{}[];':\",.<>/?")
    
    if password.count >= 8 {
        
        if !passwordCharSet.isDisjoint(with: onlyEnglish)
                    && !passwordCharSet.isDisjoint(with: onlyNumeric)
                    && !passwordCharSet.isDisjoint(with: specialCharacters) {
            return 5
        }
        else if !passwordCharSet.isDisjoint(with: onlyEnglish)
            && !passwordCharSet.isDisjoint(with: onlyNumeric) {
            return 4
        }
        

    }
    
    else {
        if passwordCharSet.isSubset(of: onlyEnglish) {
            return 2
        }
        else if passwordCharSet.isSubset(of: onlyNumeric) {
            return 1
        }

    }
    
    return 3
        
}

//print(validatePassword(password: "asd123asasd*"))



