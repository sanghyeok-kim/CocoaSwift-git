//
//  Mission2_Binary.swift
//  Week3-01-MON-Matrix_Binary_BubbleSort
//
//  Created by 김상혁 on 2021/11/15.
//

import Foundation

struct Binary {

    private var values = [String]()

    var count: Int {
        get {
            return values.count
        }
    }
    
    
    
    init(with total: Int) {
        
        var addCount = 0
    
        while true {
            let binary = String(addCount, radix: 2)
    
            if binary.count > total {
                break
            } else {
                values.append(binary)
                addCount += 1
            }
        }
        
        for i in 0..<count {
            
            let originBinaryCount = values[i].count
            let needZeroCount = values[values.endIndex - 1].count
            let gap = needZeroCount - originBinaryCount

            let addedZero = String(repeating: "0", count: gap)
            values[i].insert(contentsOf: addedZero, at: values[i].startIndex)
        }
    }

    func find(by bitCount: Int) -> Array<String> {
        var resultValues = [String]()
        
        for i in 0..<count {
            let numberOfOne = values[i].filter { $0 == "1" }.count
            if numberOfOne == bitCount {
                resultValues.append(values[i])
            }
        }
        return resultValues
    }
}

//let a = Binary(with: 5)
//a.find(by: 3)
