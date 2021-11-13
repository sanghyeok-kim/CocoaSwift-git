//
//  Mission3-123.swift
//  Week1-02-TUE-Rectangle
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

struct MyPoint {
    var myX: Float
    var myY: Float
    
    init() {
        self.myX = 0.0
        self.myY = 0.0
    }
    
    init(myX: Float, myY: Float) {
        self.myX = myX
        self.myY = myY
    }
    
    func printPoint() {
        print("(\(self.myX), \(self.myY))")
    }
}


struct Rectangle {
    /*[미션1]*/
    var leftTop: MyPoint
    var rightBottom: MyPoint

    init() {
        leftTop = MyPoint()
        rightBottom = MyPoint()
    }
    
    
    /*[미션2]*/
    init(xy: MyPoint, width: Float, height: Float) {
        
        leftTop = MyPoint(myX: xy.myX, myY: xy.myY + height)
        rightBottom = MyPoint(myX: xy.myX + width, myY: xy.myY)
    }
    
    
    func printRect() {
        print("""
            (\(leftTop.myX), \(leftTop.myY)), (\(rightBottom.myX), \(leftTop.myY)), \
            (\(leftTop.myX), \(rightBottom.myY)), (\(rightBottom.myX), \(rightBottom.myY))
            """)
    }

    
    func printArea() {
        let width: Float = rightBottom.myX - leftTop.myY
        let height: Float = leftTop.myY - rightBottom.myY

        let result: Float = width * height

        print("Area of this rectangle : \(result)")
    }

    
    func printCenter() {
        let centerOfWidth: Float = leftTop.myX + (rightBottom.myX - leftTop.myX) / 2
        let centerOfHeight: Float = rightBottom.myY + (leftTop.myY - rightBottom.myY) / 2
        
        let result = (centerOfWidth, centerOfHeight)
        
        print("Center of this rectangle : \(result)")
    }
    
    /*[미션3]*/
    mutating func moveTo(delta : MyPoint) {
        self.leftTop.myX = self.leftTop.myX + delta.myX
        self.leftTop.myY = self.leftTop.myY + delta.myY
        self.rightBottom.myX = self.rightBottom.myX + delta.myX
        self.rightBottom.myY = self.rightBottom.myY + delta.myY
    }
}



/*[미션1 출력]*/
var rect: Rectangle = Rectangle()
rect.printRect()
rect.printArea()
rect.printCenter()




/*[미션2 출력]*/
var newPoint: MyPoint = MyPoint(myX: 5, myY: 5)
var rectB: Rectangle = Rectangle(xy: newPoint, width: 5, height: 10.0)

//rectB.printPoint()
//(의문점)rectB.printPoint를 호출하라고 하셨는데,
//printPoint()는 MyPoint 구조체의 메소드이고 rectB는 Rectangle 구조체의 인스턴스이므로 에러 발생
//-> rectB.printRect()를 호출하였다
rectB.printRect()
//출력결과:(5.0, 15.0), (10.0, 15.0), (5.0, 5.0), (10.0, 5.0)




/*[미션3 출력]*/

//rectB.moveTo(delta: (-3.0, 1.5))
//(의문점)MyPoint 타입을 입력받는 moveTo()에 설명대로 (-3.0, 1.5)를 argument로 입력하는 것은 에러 발생
//-> (-3.0, 1.5) 좌표를 갖는 MyPoint 타입의 인스턴스를 생성해서, 그 인스턴스를 argument로 넣었다
var deltaPoint: MyPoint = MyPoint(myX: -3.0, myY: 1.5)
rectB.moveTo(delta: deltaPoint)
rectB.printRect()
//출력결과:(2.0, 16.5), (7.0, 16.5), (2.0, 6.5), (7.0, 6.5)
