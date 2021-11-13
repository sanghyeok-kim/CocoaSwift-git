//
//  Mission01-4.swift
//  Week1-02-THU-Rectangle
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

struct Rectangle {
    var leftTopX: Float
    var leftTopY: Float
    var rightBottomX: Float
    var rightBottomY: Float

    func printRect() {
        print("""
            Left-top: (\(leftTopX), \(leftTopY)), Right-top: (\(rightBottomX), \(leftTopY)), \
            Left-bottom: (\(leftTopX), \(rightBottomY)), Right-bottom: (\(rightBottomX), \(rightBottomY))
            """)
    }

    func printArea() {
        let width: Float = rightBottomX - leftTopX
        let height: Float = leftTopY - rightBottomY

        let result: Float = width * height

        print("Area of this rectangle : \(result)")
    }

    /*[미션 5]*/
    func printCenter() {
        let centerOfWidth: Float = leftTopX + (rightBottomX - leftTopX) / 2
        let centerOfHeight: Float = rightBottomY + (leftTopY - rightBottomY) / 2

        let result = (centerOfWidth, centerOfHeight)

        print("Center of this rectangle : \(result)")
    }


}

var rect: Rectangle = Rectangle(leftTopX: 4.5, leftTopY: 10.5, rightBottomX: 15, rightBottomY: 3.5)

rect.printRect()
rect.printArea()
rect.printCenter()
