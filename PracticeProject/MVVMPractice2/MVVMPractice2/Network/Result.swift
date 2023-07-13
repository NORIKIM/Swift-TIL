//
//  Result.swift
//  MVVMPractice2
//
//  Created by 김지나 on 2023/07/13.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(payload: T)
    case failure(U?)
}
