//
//  Mission2.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func printLeftTree(lines: Int) {
   for i in 0..<lines {
       for _ in 0...i {
           print("\u{1F388}", terminator: "")
       }
       print("")
   }

}
//printLeftTree(lines: 4)
//printLeftTree(lines: 9)
