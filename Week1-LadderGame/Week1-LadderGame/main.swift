//
//  main.swift
//  Week1-LadderGame
//
//  Created by 김상혁 on 2021/11/04.
//

import Foundation


//3. 사다리 출력하기

struct LadderGame {
    static func inputParticipant() -> Int {
        print("사다리 게임에 참여할 인원을 입력하세요 (2명~7명) : ", terminator: "")

        let input: String = readLine() ?? ""
        let inputNumbers: Int = Int(input) ?? -1

        switch inputNumbers {
        case ...1:
            print("참여 인원은 2명 이상이어야 합니다.")
        case 8...:
            print("참여 인원은 7명 이하여야 합니다.")
        default:
            return inputNumbers
        }
        
        return -1
    }
    
    
    static func printLadder(number: Int, height: Int) {
        let cols = number - 1
        let rows = height

        var ladders = [[Int]]()
        ladders = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        
        for i in 0..<rows {
            for j in 0..<cols {
                ladders[i][j] = Int.random(in: 0...1)
            }
        }

        for i in 0..<rows {
            for j in 0..<cols {
                if j == 0 {
                    print("|", terminator: "")
                }
                if ladders[i][j] == 0 {
                    print("-|", terminator: "")
                } else {
                    print(" |", terminator: "")
                }
            }
            print("")
        }
    }
}

let participantNumber: Int = LadderGame.inputParticipant()
if participantNumber != -1 {
    LadderGame.printLadder(number: participantNumber, height: 4)
}
