//
//  SearchFileSystem.swift
//  Week4-03-WED-CSV_Thread
//
//  Created by 김상혁 on 2021/11/24.
//

import Foundation

class FileSearch {
    
    //파일 찾기
    func files(at path: String) -> Array<String> {
        let fileManager = FileManager()
        do {
            let contents = try fileManager.contentsOfDirectory(atPath: path)
            return contents
            
        } catch let error as NSError {
            print("Error access directory: \(error)")
            return []
        }
    }
    
    //파일 찾기(정렬 기능 추가)
    func files(at path: String, sorted: Bool) -> Array<String> {
        let fileManager = FileManager()
        do {
            let contents = try fileManager.contentsOfDirectory(atPath: path)
            return sorted ? contents.sorted() : contents
            
        } catch let error as NSError {
            print("Error access directory: \(error)")
            return []
        }
    }
    
    
    //파일 찾기(특정 확장자)
    func files(at path: String, extensionType: String) -> Array<String> {
        let fileManager = FileManager()
        do {
            let contents = try fileManager.contentsOfDirectory(atPath: path)
            
            /*
            var result: [String] = []
            for i in 0..<contents.count {
                if contents[i].hasSuffix(extensionType) {
                    result.append(contents[i])
                }
            }
            return result
            */
            
            //위 코드를 filter를 사용해서 더 간단하게 줄였다
            let resultByFilter = contents.filter { $0.hasSuffix(extensionType) }
            return resultByFilter
            
        } catch let error as NSError {
            print("Error access directory: \(error)")
            return []
        }
    }
    
    
    //파일 존재 여부
    func isExist(filename: String, at path: String) -> Bool {
        let fileList = files(at: path)
        return fileList.contains(filename)
    }

    //파일 존재 여부(여러 개의 파일)
    func isExist(filename: String..., at path: String) -> Bool {
        
        let fileList = files(at: path)
        for i in 0..<filename.count {
            if fileList.contains(filename[i]) == false {
                return false
            }
        }
        return true
    }
}
