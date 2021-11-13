//
//  Mission1-123.swift
//  Week1-02-TUE-Rectangle
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

/*[미션 1, 2, 3]*/
struct Rectangle {
    var leftTopX: Int
    var leftTopY: Int
    var rightBottomX: Int
    var rightBottomY: Int

    func printRect() {
        print("""
            Left-top: (\(leftTopX), \(leftTopY)), Right-top: (\(rightBottomX), \(leftTopY)), \
            Left-bottom: (\(leftTopX), \(rightBottomY)), Right-bottom: (\(rightBottomX), \(rightBottomY))
            """)
    }

    func printArea() {
        let width: Int = rightBottomX - leftTopX
        let height: Int = leftTopY - rightBottomY

        let result: Int = width * height

        print("Area of this rectangle : \(result)")
    }



}

var rect: Rectangle = Rectangle(leftTopX: 5, leftTopY: 11, rightBottomX: 15, rightBottomY: 4)

rect.printRect()
rect.printArea()
