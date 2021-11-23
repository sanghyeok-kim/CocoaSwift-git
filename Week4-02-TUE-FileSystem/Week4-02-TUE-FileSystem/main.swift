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


var fileManager = FileManager.default
print(try fileManager.contentsOfDirectory(atPath:"/System/Library/Desktop Pictures"))
print(fileManager.currentDirectoryPath)
    

