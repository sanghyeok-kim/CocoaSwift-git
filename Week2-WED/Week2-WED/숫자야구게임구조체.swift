import Foundation


struct NumberBaseball {
    
    private var secretNumber: Int
    
    
    init() {
        secretNumber = 0
    }
    
    
    mutating func newGame() {
        secretNumber = Int.random(in: 100...999)
    }
    
    func hit(num: Int) -> (strikeCount: Int, ballCount: Int) {
        
        var countOfStrike = 0
        var countOfBall = 0
        
        let secretFirstNumber = secretNumber % 10
        let secretSecondNumber = secretNumber % 100 / 10
        let secretThirdNumber = secretNumber / 100
        
        let userFirstNumber = num % 10
        let userSecondNumber = num % 100 / 10
        let userThirdNumber = num / 100
        
        let userNumberArr: [Int] = [userThirdNumber, userSecondNumber, userFirstNumber]
        let secretNumberArr: [Int] = [secretThirdNumber, secretSecondNumber, secretFirstNumber]
 
        let arrCount = userNumberArr.count
        
        
        //Strike 판별
        for i in 0..<arrCount {
            if userNumberArr[i] == secretNumberArr[i] {
                countOfStrike += 1
            }
        }
        
        //Ball 판별
        for i in 0..<arrCount {
            for j in 0..<arrCount {
                if i == j {
                    continue
                }
                if userNumberArr[i] == secretNumberArr[j] {
                    countOfBall += 1
                }
            }
        }
        
        let result = (countOfStrike, countOfBall)
        return result
    }
}

//var asd = NumberBaseball()
//asd.newGame()
//asd.hit(num: 124)
