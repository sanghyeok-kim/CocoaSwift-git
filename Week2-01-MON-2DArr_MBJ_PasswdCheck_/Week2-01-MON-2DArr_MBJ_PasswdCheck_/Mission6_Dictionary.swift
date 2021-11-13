//
//  Mission6_Dictionary.swift
//  Week2-01-MON-2DArr_MBJ_PasswdCheck_
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func duplicatedWordsByArray(inputWords: Array<String>) -> Array<String> {

    let arrCount = inputWords.count
    let sortedArr = inputWords.sorted()

    var duplicatedArr = [String]()
    var resultArr = [String]()


    for i in 0..<(arrCount - 1) {
        if sortedArr[i] == sortedArr[i + 1] {
            //sortedArr에서 중복이 있는 요소들만 따로 duplicatedArr에 저장
            duplicatedArr.append(sortedArr[i])
        }
    }

    //duplicatedArr에서 중복되는 요소 한 번 더 제거
    resultArr = Array(Set(duplicatedArr))

    return resultArr
}


//duplicatedWordsByArray(inputWords: ["가을", "우주", "너굴", "우주", "겨울", "봄봄", "너굴", "너굴"])


/*코드 개선사항*/
//duplicatedArr을 Set으로 만들어서 중복 제거 후 다시 Array로 만들지 말고,
//애초부터 duplicatedArr을 Set으로 선언했으면 됐다
