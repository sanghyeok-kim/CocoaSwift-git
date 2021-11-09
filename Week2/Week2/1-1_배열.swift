//연습문제1-미션1. 2차원 배열 만들기 & 출력하기

import Foundation

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

var myArray = ArrayPractice()
myArray.printArray(array: myArray.fillArray())
