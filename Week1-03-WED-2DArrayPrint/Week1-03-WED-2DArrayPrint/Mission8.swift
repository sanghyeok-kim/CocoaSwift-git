//
//  Mission8.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func printDiamond(line: Int) {
  
    let adjustNumber: Int = line % 2 == 0 ? 1 : 0

    var countOfWhiteSpace: Int

    for  i in 1...line {

        //짝수일 때 추가되는 조건
        if adjustNumber == 1 {
            //중간의 중복되는 라인을 한 번 더 써주고, 마지막 루프는 생략
            if i == line / 2 {
                print(String(repeating: "*", count: line - 1))
            }
            if i == line {
                break
            }
        }

        countOfWhiteSpace = Int((line - ((line / 2) + i)).magnitude) + adjustNumber
        
        for _ in 0..<countOfWhiteSpace - adjustNumber {
            print(" ", terminator: "")
        }

        for _ in 0..<(line - countOfWhiteSpace * 2 + adjustNumber) {
            print("*", terminator: "")
        }
        print("")
    }
}

//printDiamond(line: 7)
//printDiamond(line: 4)
