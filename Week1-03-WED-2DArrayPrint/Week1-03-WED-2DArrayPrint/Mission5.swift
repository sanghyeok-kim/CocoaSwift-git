//
//  Mission5.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func printNumbers(line: Int) {
   var number = 1
   for i in 1...line {
       for _ in 0..<i {

           print(String(format: "%2d", number), terminator: " ")
           number += 1
       }

   print("")
   }

}

//printNumbers(line: 5)
