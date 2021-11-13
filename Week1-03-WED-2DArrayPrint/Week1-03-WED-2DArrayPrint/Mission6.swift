//
//  Mission6.swift
//  Week1-03-WED-2DArrayPrint
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

func printSquare(colums: Int) {
   var number: Int = 1
   for _ in 0..<colums {
       for _ in 0..<colums {
           print(String(format: "%2d", number), terminator: " ")
           number += 1
       }
       print("")
   }
}

//printSquare(colums: 5)
