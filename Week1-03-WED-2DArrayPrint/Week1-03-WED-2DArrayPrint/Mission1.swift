//
//  Mission1.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func printXY(max: Int) {
   for _ in 1...max {
       for j in 1...max {
           print("\(j) ", terminator: "")
       }
       print("")
   }
}

//printXY(max: 3)
//printXY(max: 5)
