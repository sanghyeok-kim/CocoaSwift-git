//
//  main.swift
//  Week1-LadderGame
//
//  Created by 김상혁 on 2021/11/04.
//

import Foundation


//2. 사다리 인원 입력
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
}

LadderGame.inputParticipant()




