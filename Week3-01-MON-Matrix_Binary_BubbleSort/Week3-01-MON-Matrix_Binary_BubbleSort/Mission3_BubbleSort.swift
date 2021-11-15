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
    
    init(numbers: Int...) {
        for number in numbers {
            originArr.append(number)
        }
    }
    
    
    
    func sorted(inAscending: Bool) -> Array<Int> {
        
        func swap(aIndex: Int, bIndex: Int, sortingWay: Bool) {
            
            if sortingWay ? resultArr[aIndex] > resultArr[bIndex] : resultArr[aIndex] < resultArr[bIndex] {
                let temp = resultArr[aIndex]
                resultArr[aIndex] = resultArr[bIndex]
                resultArr[bIndex] = temp
            }
            
        }
        
        
        var resultArr = originArr
        
        for i in 0..<originArrCount - 1 {
            for j in 0..<originArrCount - 1 - i {
                swap(aIndex: j, bIndex: j + 1, sortingWay: inAscending)
            }
        }
        
        return resultArr
    }
}

//let myArr = BubbleSort(numbers: 4, 5, 2, 1, 3)
//myArr.sorted(inAscending: true)
//myArr.sorted(inAscending: false)
