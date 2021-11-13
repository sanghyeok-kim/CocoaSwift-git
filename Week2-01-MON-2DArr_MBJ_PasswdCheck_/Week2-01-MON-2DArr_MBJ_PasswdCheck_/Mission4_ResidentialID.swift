//
//  Mission4_ResidentialID.swift
//  Week2-01-MON-2DArr_MBJ_PasswdCheck_
//
//  Created by 김상혁 on 2021/11/13.
//

func step1(step1Input: String) -> [Int] {
    let inputStr = step1Input.split(separator: "-")
    let inputNumArr = Array(inputStr[0] + inputStr[1])
    var resultAfterStep1 = Array<Int>()
    
    var plusNumber = 2
    for i in 0..<inputNumArr.count - 1 {
        
        if plusNumber == 10 {
            plusNumber = 2
        }
        resultAfterStep1.append(Int(String((inputNumArr[i])))! * plusNumber)
        plusNumber += 1
    }
    
    return resultAfterStep1
}


func step2(step2Input: [Int]) -> Int {
    var sum = 0
    
    for i in 0..<step2Input.count {
        sum += step2Input[i]
    }
    let result = sum % 11
    return result
}


func step3(step3Input: Int) -> Int {
    let result = (11 - step3Input) % 10
    return result
}


func step4(step3Result: Int, comparisonNum: Int) -> Bool {
    if step3Result == comparisonNum {
        return true
    } else {
        return false
    }
}


func nationIDValidator (input: String) -> Bool {
    
    let lastNum = Int(String(input.last!)) ?? 0
    
    let step1result = step1(step1Input: input)
    let step2result = step2(step2Input: step1result)
    let step3result = step3(step3Input: step2result)
    let step4result = step4(step3Result: step3result, comparisonNum: lastNum)
    
    return step4result
}

//nationIDValidator(input: "123456-1234567")
