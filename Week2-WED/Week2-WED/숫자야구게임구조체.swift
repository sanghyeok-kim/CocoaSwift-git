import Foundation


struct NumberBaseball {
    
    private var secretNumber: Int
    
    
    init() {
        secretNumber = 0
    }
    
    
    mutating func newGame() {
        secretNumber = Int.random(in: 100...111)
        print(secretNumber)
    }
    
    func hit(num: Int) -> (strikeCount: Int, ballCount: Int) {
        
        var countOfStrike = 0
        var countOfBall = 0
        let result = (countOfStrike, countOfBall)
        
        
        let userFirstNumber = secretNumber % 10
        let userSecondNumber = secretNumber % 100 / 10
        let userThirdNumber = secretNumber / 100
        
        let secretFirstNumber = num % 10
        let secretSecondNumber = num % 100 / 10
        let secretThirdNumber = num / 100
        
        let userNumberArr: [Int] = [userFirstNumber, userSecondNumber, userThirdNumber]
        let secretNumberArr: [Int] = [secretFirstNumber, secretSecondNumber, secretThirdNumber]
        
        let arrCount = userNumberArr.count
        
        for i in 0..<arrCount {
            userNumberArr.contains { (n) -> Bool in
                print(n, secretNumberArr[i])
                return n == secretNumberArr[i]
            }
        }
        
        
        
        
        //var countOfStrike = 0
        //var countOfBallcount = 0
        
        
        
        return (1, 1)
    }
    

}

//---main.swift---
//var asd = NumberBaseball()
//asd.newGame()
//asd.hit(num: 123)
