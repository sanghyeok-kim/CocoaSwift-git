//연습문제1-미션2. setBoolArray와 printArray

import Foundation

struct ArrayPractice {
    
    func setBoolArray() -> Array<Array<Bool>> {
        let rows = 7
        
        var arr: Array<Array<Bool>> = Array(repeating: Array(repeating: false, count: rows), count: rows)

        for i in 0..<rows {
            for j in 0..<rows {
                if (i + j) >= (rows - 1) {
                    arr[i][j] = true
                }
            }
        }
        return arr
    }
    

    func printArray(array: Array<Array<Bool>>, newChar: Character) -> Void {
        
        let rows = array.count
        
        for i in 0..<rows {
            for j in 0..<array[i].count {
                if array[i][j] == true {
                    print(newChar, terminator: "")
                } else {
                    print(" ", terminator: "")
                }
            }
            print("")
        }
    }
    
}

var myArray = ArrayPractice()
myArray.printArray(array: myArray.setBoolArray(), newChar: "$")
