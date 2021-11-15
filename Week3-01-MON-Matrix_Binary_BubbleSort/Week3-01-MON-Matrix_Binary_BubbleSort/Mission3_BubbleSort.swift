//
//  Mission3_BubbleSort.swift
//  Week3-01-MON-Matrix_Binary_BubbleSort
//
//  Created by 김상혁 on 2021/11/15.
//

import Foundation

class BubbleSort {
    
    private var originArr = [Int]()
    
    var originArrCount: Int {
        get {
            return originArr.count
        }
    }
    
    init(numbers: [Int]) {
        originArr = numbers
    }
    
    
    func sorted(inAscending: Bool) -> Array<Int> {
        
        func swap(aIndex: Int, bIndex: Int) {
            if resultArr[aIndex] > resultArr[bIndex] {
                let temp = resultArr[aIndex]
                resultArr[aIndex] = resultArr[bIndex]
                resultArr[bIndex] = temp
            }
        }
        
        var resultArr = originArr
        
        
        for i in 0..<originArrCount - 1 {
            for j in 0..<originArrCount - 1 - i {
                inAscending ? swap(aIndex: j, bIndex: j + 1) : swap(aIndex: j + 1, bIndex: j)
            }
        }
        
        return resultArr
    }
}
