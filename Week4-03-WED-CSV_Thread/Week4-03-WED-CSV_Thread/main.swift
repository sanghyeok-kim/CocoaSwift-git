//
//  main.swift
//  Week4-03-WED-CSV_Thread
//
//  Created by 김상혁 on 2021/11/24.
//

import Foundation


/*--------------------연습문제1--------------------*/
let targetPath = "/System/Library/Desktop Pictures"
let contents = FileSearch()

//파일 찾기
//print(contents.files(at: targetPath))


//파일 찾기(정렬 기능 추가)
//print(contents.files(at: targetPath, sorted: true))


//파일 찾기(특정 확장자)
//print(contents.files(at: targetPath, extensionType: ".heic"))
//print(contents.files(at: targetPath, extensionType: ".doc"))


//파일 존재 여부
//print(contents.isExist(filename: "hello Blue.heic", at: targetPath))


//파일 존재 여부(여러 개의 파일)
//print(contents.isExist(filename: "hello Blue.heic", "hello Red.heic", at: targetPath))


