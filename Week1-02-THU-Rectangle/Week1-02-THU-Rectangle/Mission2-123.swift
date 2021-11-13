//
//  Mission2-123.swift
//  Week1-02-THU-Rectangle
//
//  Created by 김상혁 on 2021/11/13.
//

import Foundation

struct MyPoint {
    var myX: Float
    var myY: Float
    
    
    func printPoint() {
        print("(\(self.myX), \(self.myY))")
    }
    
    
    /*[미션2]*/
    mutating func setX(to x: Float) {
        self.myX = x
    }
    mutating func setY(to y: Float) {
        self.myY = y
    }
    
    
    
    /*[미션3]*/
    func getDistanceTo(toPoint: MyPoint) -> Float {
        let width: Float
        let height: Float
        let hypotenuse: Float
        
        width = (myX > toPoint.myX) ? myX - toPoint.myX : toPoint.myX - myX
        height = (myY > toPoint.myY) ? myY - toPoint.myY : toPoint.myY - myY
        
        hypotenuse = sqrt((width * width) + (height * height))
        return hypotenuse
    }


    

}
/*[미션1 출력]*/
var pointA: MyPoint = MyPoint(myX: 2.5, myY: 15.8)
pointA.printPoint()

/*[미션2 출력]*/
pointA.setX(to: 15.2)
pointA.setY(to: 7.4)
print("pointA=(\(pointA.myX), \(pointA.myY))")


/*[미션3 출력]*/
let pointB: MyPoint = MyPoint(myX: 15.0, myY: 12.2)
let distanceFromAToB = pointA.getDistanceTo(toPoint: pointB)
print(distanceFromAToB)
