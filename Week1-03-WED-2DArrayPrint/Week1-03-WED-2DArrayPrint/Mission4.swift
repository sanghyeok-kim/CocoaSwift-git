//
//  Mission4.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func printCenterTree(lines: Int) {
   for i in (0..<lines).reversed(){
       for _ in 0..<i {
           print(" ", terminator: "")
       }
       for _ in 0..<(lines - i) {
           print("\u{1F388} ", terminator: "")
       }
   print("")
   }
}

//printCenterTree(lines: 5)
//printCenterTree(lines: 8)
