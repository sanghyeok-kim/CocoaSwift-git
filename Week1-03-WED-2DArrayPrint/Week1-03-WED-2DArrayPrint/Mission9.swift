//
//  Mission9.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by κΉμν on 2021/11/13.
//

import Foundation

func print3515(lines : Int) -> Array<Array<String>> {

   var arr3515 = [[String]]()
   arr3515 = Array(repeating: Array(repeating: "", count: 1), count: lines)

   for i in 1...lines {
       let index: Int = i - 1
       if i % 15 == 0 {
           arr3515[index][0] = ("ππ")
       }
       else if i % 3 == 0 {
           arr3515[index][0] = ("π")
       }
       else if i % 5 == 0 {
           arr3515[index][0] = ("π")
       }
       else {
           arr3515[index][0] = ("\(i)")
       }
   }
   print("μλ ₯ lines=\(lines)")
   print("μΆλ ₯\n[")
   for i in 0..<arr3515.count {
       print("\t\"\(arr3515[i][0])\"")
   }
   print("]")

   return arr3515
}

//var resultArr = [[String]]()
//resultArr = print3515(lines: 15)
//resultArr = print3515(lines: 30)
