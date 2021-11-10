import Foundation


struct NumberBaseball {
    
    private var secretFirstNumber: Int = 0
    private var secretSecondNumber: Int = 0
    private var secretThirdNumber: Int = 0

    
    mutating func makeSecretNumber() {
        var secretNumbers = [Int]()

        for _ in 0..<3 {
            var newRandomNumber = Int.random(in: 0...9)
            
            while secretNumbers.contains(newRandomNumber) {
                newRandomNumber = Int.random(in: 0...9)
            }
            secretNumbers.append(newRandomNumber)
        }
        
        secretFirstNumber = secretNumbers[0]
        secretSecondNumber = secretNumbers[1]
        secretThirdNumber = secretNumbers[2]
    }

    
    func hit(num: Int) -> (strikeCount: Int, ballCount: Int) {
        
        var countOfStrike = 0
        var countOfBall = 0

        let userFirstNumber = num / 100
        let userSecondNumber = num % 100 / 10
        let userThirdNumber = num % 10
        
        let userNumberArr: [Int] = [userFirstNumber, userSecondNumber, userThirdNumber]
        let secretNumberArr: [Int] = [secretFirstNumber, secretSecondNumber, secretThirdNumber]
 
        let arrCount = userNumberArr.count
        
        
        //Strike 판별
        for i in 0..<arrCount {
            if userNumberArr[i] == secretNumberArr[i] {
                countOfStrike += 1
            }
        }
        
        if countOfStrike == 3 {
            let result = (countOfStrike, countOfBall)
            return result
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
    
    
    func showGameScore() -> Bool {
        var count = 9
        print("3자리 숫자 ???를 맞추세요. 기회는 \(count)번 주어집니다.")

        while count != 0 {
            let userNumber = Int(readLine() ?? "") ?? 0
            let gameResult = self.hit(num: userNumber)
            
            if gameResult == (3, 0) {
                print("맞췄습니다!")
                return true

            } else {
                count -= 1
                print("\(gameResult) - 남은 횟수 : \(count)")
            }
        }
        print("---game over---")
        print("정답 : \(secretFirstNumber)\(secretSecondNumber)\(secretThirdNumber)")
        return false
    }
}
