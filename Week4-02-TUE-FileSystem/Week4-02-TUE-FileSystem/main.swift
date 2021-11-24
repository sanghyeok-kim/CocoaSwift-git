//
//  main.swift
//  Week4-02-TUE-FileSystem
//
//  Created by 김상혁 on 2021/11/23.
//
import Foundation

/*--------------------Thread--------------------*/
class BackgroundWork {
    var thread : Thread? = nil
    
    func doTimeConsumingOperation(operation : Any?) {
        thread = Thread(target: self,
                   selector: #selector(BackgroundWork.runHelper), object: operation)
        thread?.start()
    }
    
    @objc func runHelper(operation : Any?) {
        autoreleasepool { () in
            //operation.doOperation()
            print("Other thread is running...")
        }
    }
}

let some = BackgroundWork()

var threadCount = 0

func doSomething() {
    threadCount += 1
    print("Thread Start!")
    print(threadCount)
}


some.doTimeConsumingOperation(operation: doSomething())
some.doTimeConsumingOperation(operation: doSomething())
some.doTimeConsumingOperation(operation: doSomething())





/*--------------------File Manager--------------------*/


//함수화 하지않은 코드
var fileManager = FileManager.default
print(try fileManager.contentsOfDirectory(atPath:"/System/Library/Desktop Pictures"))
print(fileManager.currentDirectoryPath)
    
//함수화한 코드
func displayAllFiles(at path:String) {
    let fileManager = FileManager()
    
    do {
        let contents = try fileManager.contentsOfDirectory(atPath: path)
        for (i, v) in contents.enumerated() {
            print(i,v)
        }
    } catch let error as NSError {
        print("Error access directory: \(error)")
    }
}

displayAllFiles(at: "/System/Library/Desktop Pictures")
