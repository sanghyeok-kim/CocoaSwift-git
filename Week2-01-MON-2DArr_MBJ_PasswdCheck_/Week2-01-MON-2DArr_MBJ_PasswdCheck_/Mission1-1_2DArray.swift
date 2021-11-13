//
//  Mission1-2DArray.swift
//  Week2-01-MON-2DArr_MBJ_PasswdCheck_
//
//  Created by 김상혁 on 2021/11/13.
//

struct ArrayPractice {
    
    func fillArray() -> Array<Array<Int>> {
        
        var twoDimensionArr: [[Int]] = Array(repeating: Array(repeating: 0, count: 0), count: 5)
        
        let rows = twoDimensionArr.count
        var plusNumber = 0
        
        for i in 0..<rows {
            for j in 0..<rows {
                plusNumber += 1
                if i < j {
                    continue
                }
                twoDimensionArr[i].append(plusNumber)
            }
        }
        return twoDimensionArr
    }

    func printArray (array: [[Int]]) -> Void {
        let row = array.count
        for i in 0..<row {
            print(array[i])
        }
    }
    
}

//var myArray = ArrayPractice()
//myArray.printArray(array: myArray.fillArray())
