//
//  subject.swift
//  MyCalculator
//
//  Created by 김지나 on 2017. 9. 12..
//  Copyright © 2017년 김지나. All rights reserved.
//

import Foundation

class Subject {
    var name: String = ""
    var score: Int = 0
    var credit: Int = 1
    var grade: String = "F"
    var gradePoint: Double = 0.0
    
    
    init(name: String) {
        self.name = name
    }
    init() {
        print("초기화")
    }
    func setScore(score:Int) {
        self.score = score
    }
}
