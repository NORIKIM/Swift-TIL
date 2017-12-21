//
//  main.swift
//  LadderGame
//
//  Created by JINA on 2017. 12. 21..
//  Copyright © 2017년 김지나. All rights reserved.
//

import Foundation

// 참여인원 입력 받기
func getPeople() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let people = readLine()
    return Int(people!)!
}

// 사다리 높이 입력 받기
func getLadderHeight() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderHeight = readLine()
    return Int(ladderHeight!)!
}

// 사다리 만들기
func makeLadder() -> [[String]] {
    let people = getPeople()
    let ladderHeight = getLadderHeight()
    var arrLadder: [[String]] = Array(repeating: Array(repeating: "|", count: people+2), count: ladderHeight)
    
    for i in 0 ..< arrLadder.count {
        for j in 1 ..< arrLadder.count  {
            if j % 2 == 1 {
                arrLadder[i][j] = " "
            }
        }
    }
    
    return arrLadder
    // [["|", " ", "|", " ", "|"],
    //  ["|", " ", "|", " ", "|"],
    //  ["|", " ", "|", " ", "|"],
    //  ["|", " ", "|", " ", "|"],
    //  ["|", " ", "|", " ", "|"]]
}

