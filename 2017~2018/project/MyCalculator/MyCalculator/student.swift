//
//  student.swift
//  MyCalculator
//
//  Created by 김지나 on 2017. 9. 12..
//  Copyright © 2017년 김지나. All rights reserved.
//

import Foundation

class Student {
    var name: String
    var studentId: Int
    
    var subjects:[Subject] = []
    var totalGrade: String = "F"
    var totalScore: Int = 0
    var totalGradePoint: Double = 0.0 //학점
    var average: Double = 0.0
    
    
    init(name: String, id: Int) {
        self.name = name
        studentId = id
    }

    func setSubjects(subjects:[Subject]) {
       self.subjects = subjects
    }
    
    func addSubjects(subjects:Subject) {
        self.subjects.append(subjects)
    }
}
