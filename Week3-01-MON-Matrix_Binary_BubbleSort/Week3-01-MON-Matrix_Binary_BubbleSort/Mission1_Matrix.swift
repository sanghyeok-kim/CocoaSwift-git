//
//  Mission1_Matrix.swift
//  Week3-01-MON-Matrix_Binary_BubbleSort
//
//  Created by 김상혁 on 2021/11/15.
//

import Foundation

class Matrix {
    var a: Double
    var b: Double
    var c: Double
    var d: Double
    
    init(a: Double = 0.0, b: Double = 0.0, c: Double = 0.0, d: Double = 0.0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    func sum(with other: Matrix) -> Matrix {
        let newA = self.a + other.a
        let newB = self.b + other.b
        let newC = self.c + other.c
        let newD = self.d + other.d
        return Matrix(a: newA, b: newB, c: newC, d: newD)
    }
    
    func product(with other: Matrix) -> Matrix {
        let newA = self.a * other.a + self.b * other.c
        let newB = self.a * other.b + self.b * other.d
        let newC = self.c * other.a + self.d * other.c
        let newD = self.c * other.b + self.d * other.d
        return Matrix(a: newA, b: newB, c: newC, d: newD)
    }
    
}

