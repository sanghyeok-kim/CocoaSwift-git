//
//  Mission2_CSVFileParsing.swift
//  Week4-03-WED-CSV_Thread
//
//  Created by 김상혁 on 2021/11/24.
//

import Foundation

class ParsingCSV {
    
    var categories: [String] = []
    var dictionaries = [[String:Any]]()
    
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
                self.dictionaries.append(lineDictionary)
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
        self.dictionaries.append(newDict)
    }
    
    func findBy(name: String) -> Dictionary<String, Any> {
        for i in 0..<self.dictionaries.count {
            if (self.dictionaries[i]["name"] as! String == name) {
                return self.dictionaries[i]
            }
        }
        return [:]
    }
    
    func removeBy(email: String) -> Bool {
        for i in 0..<self.dictionaries.count {
            if (self.dictionaries[i]["email"] as! String == email) {
                self.dictionaries[i].removeAll()
                return true
            }
        }
        return false
    }
    
    func write(to file : String) -> Bool {
        var newText = self.categories.joined(separator: ", ")
        newText.append("\n")
        for i in 0..<self.dictionaries.count {
            for j in 0..<self.dictionaries.count {
                if j < self.categories.count - 1{
                    newText.append("\(self.dictionaries[i][categories[j]]!), ")
                } else {
                    newText.append("\(self.dictionaries[i][categories[j]]!)\n")
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
            let newFilePath = try fileManager.url(for: .desktopDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let url = newFilePath.appendingPathComponent(file)
            try newText.write(to: url, atomically: true, encoding: String.Encoding.utf8)
            print("파일이 정상적으로 생성됨")
            return true
        }
        catch {
            return false
        }
    }
    
    func printDict() {
        print(self.dictionaries)
    }
}





