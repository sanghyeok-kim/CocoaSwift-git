//연습문제3. 비밀번호 등급 확인

import Foundation

func parseAndReturn(password: String, pattern: String, returnValue: Int) -> Int {
    
    if let range = password.range(of: pattern, options: [.regularExpression]),
       (range.lowerBound, range.upperBound) == (password.startIndex, password.endIndex) {
        return returnValue
    }
    return 0
}

func passwordValidator(password: String) -> Int {
    
    var pattern: String
    
    
    

    //숫자로만 되어있는 7자리 이하 문자열
    parseAndReturn(password: password, pattern:"[0-9]{0,7}", returnValue: 1)
    
    

    //영문자로만 되어있는 7자리 이하 문자열
    parseAndReturn(password: password, pattern:"[a-zA-Z]{0,7}", returnValue: 2)

    
/*---------------미완성---------------*/
    
    //1개 이상의 영문자와 1개 이상의 숫자로 되어있는 8자리 이상 문자열
//    pattern = "^(?=.*[A-Za-z])(?=.*[0-9]).{8,}"
    pattern = "(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d]){8,}"
    if let range = password.range(of: pattern, options: [.regularExpression]),
       (range.lowerBound, range.upperBound) == (password.startIndex, password.endIndex) {
    
        return 4
    }
    
    //1개 이상의 영문자, 1개 이상의 숫자, 1개 이상의 특수문자로 되어있는 8자리 이상 문자열
    //[`~!@#$%^&*()-_=+\\|[]{};:'\",.<>/?]
    pattern = "[a-zA-Z0-9]{8,}"
    if let range = password.range(of: pattern, options: [.regularExpression]),
       (range.lowerBound, range.upperBound) == (password.startIndex, password.endIndex) {

        return 5
    }
    

    return 0

}
    
//passwordValidator(password: "12345aasdasdasdasdASD")
passwordValidator(password: "0asdsa")
