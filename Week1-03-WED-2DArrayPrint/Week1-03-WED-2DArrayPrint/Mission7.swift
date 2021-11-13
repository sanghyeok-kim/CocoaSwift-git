//
//  Mission7.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func printReverse(line: Int) {
   var number: Int = 1

   for i in 1...line {

       if i % 2 == 0 {
           number += line
           for j in 1...line {
               print(String(format: "%2d", number - j), terminator: " ")
           }
       }
       else {
           for _ in 0..<line {
           print(String(format: "%2d", number), terminator: " ")
           number += 1
           }
       }
       print("")
   }

}

//printReverse(line: 4)
