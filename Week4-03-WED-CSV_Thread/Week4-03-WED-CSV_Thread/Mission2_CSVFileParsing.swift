//
//  Mission2_CSVFileParsing.swift
//  Week4-03-WED-CSV_Thread
//
//  Created by 김상혁 on 2021/11/24.
//

import Foundation



import Foundation

class ParsingCSV {
    
    var categories: [String] = []
    var dictionaryFromCSV = [[String:Any]]()
    
    init(path: String) {
        do{
            let content = try String(contentsOfFile: path).components(separatedBy: "\n")
            
            self.categories = content[0]
                .components(separatedBy: ",")
                .map { $0.trimmingCharacters(in: .whitespaces) }
            
            let lines = Array(content.dropFirst())
            
            for i in 0..<lines.count {
                let eachLine = lines[i]
                    .components(separatedBy: ",")
                    .map { $0.trimmingCharacters(in: .whitespaces) }
                
                var lineDictionary = [String:Any]()
                
                for j in 0..<categories.count {
                    if categories[j] == "grade" {
                        lineDictionary.updateValue(Int(eachLine[j]) ?? "", forKey: categories[j])
                    } else {
                        lineDictionary.updateValue(eachLine[j], forKey: categories[j])
                    }
                }
                self.dictionaryFromCSV.append(lineDictionary)
            }
        }
        catch{
            print("파일을 찾을 수 없음")
        }
    }
    
    func add(name: String, email: String, language: String, grade: Int) {
        let newValues: [Any] = [name, email, language, grade]
        
        var newDict = [String: Any]()
        for i in 0..<categories.count {
            newDict.updateValue(newValues[i], forKey: categories[i])
        }
        self.dictionaryFromCSV.append(newDict)
    }
    
    func findBy(name: String) -> Dictionary<String, Any> {
        for i in 0..<self.dictionaryFromCSV.count {
            if (self.dictionaryFromCSV[i]["name"] as! String == name) {
                return self.dictionaryFromCSV[i]
            }
        }
        return [:]
    }
    
    func removeBy(email: String) -> Bool {
        for i in 0..<self.dictionaryFromCSV.count {
            if (self.dictionaryFromCSV[i]["email"] as! String == email) {
                self.dictionaryFromCSV[i].removeAll()
                return true
            }
        }
        return false
    }
    
    func write(to file : String) -> Bool {
        var newText = self.categories.joined(separator: ", ")
        newText.append("\n")
        for i in 0..<self.dictionaryFromCSV.count {
            for j in 0..<self.dictionaryFromCSV.count {
                if j < self.categories.count - 1{
                    newText.append("\(self.dictionaryFromCSV[i][categories[j]]!), ")
                } else {
                    newText.append("\(self.dictionaryFromCSV[i][categories[j]]!)\n")
                }
            }
        }
        
        let fileManager = FileManager.default
        let target = FileSearch()
        
        if target.isExist(filename: file, at: "/Users/sanghyeok/Desktop") {
            print("같은 이름의 파일이 이미 존재함")
            return false
        }
        
        do {
            let path = try fileManager.url(for: .desktopDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent(file)
            try newText.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            print("파일이 정상적으로 생성됨")
            return true
        }
        catch {
            return false
        }
    }
    
    func printDict() {
        print(self.dictionaryFromCSV)
    }
}





