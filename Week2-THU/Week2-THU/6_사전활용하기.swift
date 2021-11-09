//연습문제6. 사전(Dictionary) 활용하기

import Foundation



//Array, Set 이용해서 풀기
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


duplicatedWordsByArray(inputWords: ["가을", "우주", "너굴", "우주", "겨울", "봄봄", "너굴", "너굴"])




/*------------미완----------*/
//Dictionary 이용해서 풀기
//func duplicatedWordsByDict(inputWords: Array<String>) -> Array<String> {
//    let count = inputWords.count
//    var dict = [String: String]()
//
//
//
//    for i in 0..<count {
//        dict[inputWords[i]] = ""
//    }
//
//    let nonDuplicatedArr: Array<String> = Array(dict.keys)
//
//
//    for i in 0..<count {
//        if inputWords.filter( )    }
//
//
//    return
//}
//
//duplicatedWordsByDict(inputWords: ["가을", "우주", "너굴", "우주", "겨울", "봄봄", "너굴", "너굴"])

    
    
