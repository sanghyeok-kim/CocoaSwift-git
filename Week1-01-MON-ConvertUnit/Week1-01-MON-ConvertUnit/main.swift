//
//  main.swift
//  Week1-01-MON-ConvertUnit
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

/*--------------------[미션1]--------------------*/
print("\n[미션1]")

//1inch = 2.54cm
func convertToCM(fromInches: Float) -> Float {
    let result = fromInches * 2.54
    return result
}

//50inch -> cm
print(convertToCM(fromInches: 50)) //결과: 127.0
//15inch -> cm
print(convertToCM(fromInches: 15)) //결과: 38.1




/*--------------------[미션2]--------------------*/
print("\n[미션2]")

//1cm = 약 0.3937inch
func converToInches(fromCM: Float) -> Float {
    let result = fromCM * 0.3937
    return result
}

//254cm -> inch
print(converToInches(fromCM: 254)) //결과: 99.9998
//75cm -> inch
print(converToInches(fromCM: 75)) //결과: 29.5275




/*--------------------[미션3]--------------------*/
print("\n[미션3]")

//1m = 약 39.37inch
func convertToInches(fromMeter: Float) -> Float {
    let result = fromMeter * 39.37
    return result
}

//1.5m -> inch
print(convertToInches(fromMeter: 1.5)) //결과: 59.055
//0.4m -> inch
print(convertToInches(fromMeter: 0.4)) //결과: 15.748





/*--------------------추가미션--------------------*/

func convertCmToMeter(fromCm: Float) -> Float {
    let result = fromCm * 0.01
    return result
}

func convertMToCm(fromMeter: Float) -> Float {
    let result = fromMeter * 100
    return result
}

func convertInchToCm(fromInch: Float) -> Float {
    let result = fromInch * 2.54
    return result
}



func extractNumber(inputStr : String) -> Float {
    let inputNum = Float(inputStr.components(separatedBy:CharacterSet.init(charactersIn: "0123456789.").inverted).joined())
    
    if let unwrappedInputNum: Float = inputNum {
        return unwrappedInputNum
    }
    
    return -1
}



func convert(inputStr: String) -> Float {

    let eachStr = inputStr.split(separator: " ")
    let length = eachStr.count
    var numberOfFirstString: Float
    var temp: Float
    var result: Float
    
    numberOfFirstString = extractNumber(inputStr: String(eachStr[0]))
    
    //[값] [변환할 단위]가 입력된 경우 -> (문자열 2개로 각각 처리)
    if length == 2 {
        
        //첫 번째 문자가 "cm"으로 끝날 경우
        if eachStr[0].hasSuffix("cm") {
            switch eachStr[1]{
            
            case "inch": //cm -> inch
                result = converToInches(fromCM: numberOfFirstString)
                return result
                
            case "m": //cm -> m
                result = convertCmToMeter(fromCm: numberOfFirstString)
                return result
                
            default:
                return -1
            }
        }
        
        //첫 번째 문자가 "inch"로 끝날 경우
        else if eachStr[0].hasSuffix("inch") {
            switch eachStr[1]{
            
            case "cm": //inch -> cm
                result = convertInchToCm(fromInch: numberOfFirstString)
                return result
                
            case "m": //inch -> cm -> m
                temp = convertInchToCm(fromInch: numberOfFirstString)
                result = convertCmToMeter(fromCm: temp)
                return result
                
            default:
                return -1
            }
        }
        
        //첫 번째 문자가 "m"으로 끝날 경우
        else if eachStr[0].hasSuffix("m") {
            switch eachStr[1]{
            
            case "inch": //m -> cm -> inch
                temp = convertMToCm(fromMeter: numberOfFirstString)
                result = converToInches(fromCM: temp)
                return result
                
            case "cm": //m -> cm
                result = convertMToCm(fromMeter: numberOfFirstString)
                return result
                
            default:
                return -1
            }
        }
    }


    //[값]만 입력된 경우 -> (문자열 1개로 처리)
    else if length == 1 {

        if inputStr.hasSuffix("cm") {
            print("\ncm를 m로 변환합니다")
            let number = inputStr.split(separator: "c")
            if let nonOptNumber = Float(number[0]) {
                result = convertCmToMeter(fromCm: nonOptNumber)
                return result

            }
            
        }
        else if inputStr.hasSuffix("inch") {
            print("\ninch를 cm로 변환합니다")
            let number = inputStr.split(separator: "i")
            if let nonOptNumber = Float(number[0]) {
                result = convertInchToCm(fromInch: nonOptNumber)
                return result

            }
        }
        else if inputStr.hasSuffix("m") {
            print("\nm를 cm로 변환합니다")
            let number = inputStr.split(separator: "m")
            if let nonOptNumber = Float(number[0]) {
                result = convertMToCm(fromMeter: nonOptNumber)
                return result
            }

        }
    }

    print("[기존 값(단위포함)] [변환할 단위] 형식으로 입력해주세요")
    return -1
}




print("\n[추가미션]")

print(convert(inputStr: "18cm inch"))
print(convert(inputStr: "25.4inch m"))
print(convert(inputStr: "0.5m inch"))
print(convert(inputStr: "183cm"))
print(convert(inputStr: "3.14m"))
print(convert(inputStr: "2.54inch"))


/*참조*/
//String을 공백(" ") 단위로 쪼개기
//https://stackoverflow.com/questions/25678373/split-a-string-into-an-array-in-swift
//문자열에서 특정 문자 찾아서 제거하기
//https://stackoverflow.com/questions/36594179/remove-all-non-numeric-characters-from-a-string-in-swift/36607684
