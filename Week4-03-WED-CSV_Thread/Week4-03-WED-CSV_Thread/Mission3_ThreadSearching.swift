//
//  Mission3_ThreadSearching.swift
//  Week4-03-WED-CSV_Thread
//
//  Created by 김상혁 on 2021/11/24.
//

import Foundation

class ThreadSearching {
    
    let words = [
        "대중", "경제", "재산", "자유", "국제",
        "시장", "사상", "부자", "학자", "개인",
        "욕망", "생활", "자원", "사람", "노동",
        "인물", "소비", "사회", "이론", "새로운"
    ]
    var contexts: String
    var thread: Thread? = nil
    
    init?(path: String) {
        do{
            self.contexts = try! String(contentsOfFile: path)
        }
        catch {
        print("파일을 찾을 수 없음")
        }
    }
    
    func countAll() {
        for word in words {
            doTimeConsumingSearch(word: word)
        }
    }
    
    func countAllOneThread() {
        for word in words {
            count(word: word)
        }
    }
    
    func doTimeConsumingSearch(word: String) {
        thread = Thread(target: self,
                   selector: #selector(ThreadSearching.count), object: word)
        thread?.start()
    }
    
    @objc func count(word: String) {
        autoreleasepool { () in
            print("Other thread is running...")
        }
    }
}
