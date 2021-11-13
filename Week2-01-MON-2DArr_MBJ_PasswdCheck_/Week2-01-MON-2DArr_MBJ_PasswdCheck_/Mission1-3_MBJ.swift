//
//  Mission1-3_MBJ.swift
//  Week2-01-MON-2DArr_MBJ_PasswdCheck_
//
//  Created by 김상혁 on 2021/11/13.
//

func printMagicSquare(inputArr: Array<Array<Int>>) {
    let row = inputArr.count

    for i in 0..<row {
        for j in 0..<row {
            print(String(format: "%3d", inputArr[i][j]), terminator: "")
        }
        print("")
    }
}

func makeMagicSquare(row: Int) -> Array<Array<Int>> {
    let startNumber = 1
    let startRow = 0
    let startCol = (row / 2)

    var arr = Array(repeating: Array(repeating: 0, count: row), count: row)
    arr[startRow][startCol] = startNumber


    let limitRowUpside = 0
    let limitColRightside = row - 1

    var nextRow = startRow
    var nextCol = startCol
    var count = 1

    
    for _ in 0..<(row * row - 1) {
        count += 1
        nextRow -= 1
        nextCol += 1
        
        if nextRow < limitRowUpside && nextCol > limitColRightside {
            nextRow += 2
            nextCol -= 1
            arr[nextRow][nextCol] = count
            continue
        }
        
        if nextRow < limitRowUpside {
            nextRow += row
            arr[nextRow][nextCol] = count
            continue
        }
    
        if nextCol > limitColRightside {
            nextCol -= row
            arr[nextRow][nextCol] = count
            continue
        }
        
        if arr[nextRow][nextCol] != 0 {
            nextRow += 2
            nextCol -= 1
            arr[nextRow][nextCol] = count
            continue
        }
        
        if arr[nextRow][nextCol] == 0 {
            arr[nextRow][nextCol] = count
            continue
        }
        
    }
    
    return arr
}


//let myMagicSquare = makeMagicSquare(row: 3)
//let myMagicSquare = makeMagicSquare(row: 5)
//printMagicSquare(inputArr: myMagicSquare)
