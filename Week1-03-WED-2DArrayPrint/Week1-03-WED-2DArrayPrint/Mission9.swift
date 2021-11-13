//
//  Mission9.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func print3515(lines : Int) -> Array<Array<String>> {

   var arr3515 = [[String]]()
   arr3515 = Array(repeating: Array(repeating: "", count: 1), count: lines)

   for i in 1...lines {
       let index: Int = i - 1
       if i % 15 == 0 {
           arr3515[index][0] = ("👏🙏")
       }
       else if i % 3 == 0 {
           arr3515[index][0] = ("👏")
       }
       else if i % 5 == 0 {
           arr3515[index][0] = ("🙏")
       }
       else {
           arr3515[index][0] = ("\(i)")
       }
   }
   print("입력 lines=\(lines)")
   print("출력\n[")
   for i in 0..<arr3515.count {
       print("\t\"\(arr3515[i][0])\"")
   }
   print("]")

   return arr3515
}

//var resultArr = [[String]]()
//resultArr = print3515(lines: 15)
//resultArr = print3515(lines: 30)
