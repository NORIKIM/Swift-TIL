//
//  SubjectCalculator.swift
//  MyCalculator
//
//  Created by 김지나 on 2017. 9. 12..
//  Copyright © 2017년 김지나. All rights reserved.
//

import Foundation

class SubjectCalculator {
    
//    func averageCalculation(student:Student) -> Double {
//        
//        var totalScore: Int = 0
//        var subject = student.subject
//        
//        for subject in Subjects {
//totalScore += Subject.Score
//        }
    
        
        
        
        //평균내기         student.totalGradePoint
//        func ave(subjects:[subject]) -> Double {
//            var sum = 과목들 합
//            var count = 과목 개수
//            var aveValue = sum / count
//            for score in subjects {
//                sum += score
//            }
//            return aveValue
//        }
    }
    
    func sumAllSubject(subjects:[Subject]) -> Int {
        var totalScore: Int = 0
        
        for s in subjects {
            totalScore += s.score
        }
        return totalScore
        
    }
    
    

