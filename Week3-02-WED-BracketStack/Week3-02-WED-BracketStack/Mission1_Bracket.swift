//
//  Mission1_Bracket.swift
//  Week3-02-WED-BracketStack
//
//  Created by 김상혁 on 2021/11/17.
//

enum Bracket: String {
    case round = "("
    case square = "["
    case curly = "{"
}

struct BracketStack {
    
    private var bracketType: Bracket
    private var bracketStack: [String] = []
    
    init(type: Bracket) {
        bracketType = type
    }
    
    var isEmptyStack: Bool {
       return bracketStack.isEmpty
    }
    
    var topOfStack: String? {
        return bracketStack.last
    }
    
    mutating func push(value: String) {
        bracketStack.append(value)
    }
    
    mutating func popLast() -> String? {
        return isEmptyStack ? nil : bracketStack.removeLast()
    }
    
    
    mutating func analyze(with value: String) -> Bool {
        let values = value.map { String($0) }
        let valueCount = values.count
        
        for i in 0..<valueCount {
            
            if values[i] == bracketType.rawValue {
                push(value: values[i])
            }
            
            else if topOfStack == bracketType.rawValue {
                    popLast()
            }
            
            else {
                push(value: values[i])
            }
        }

        return bracketStack.isEmpty
    }
}
