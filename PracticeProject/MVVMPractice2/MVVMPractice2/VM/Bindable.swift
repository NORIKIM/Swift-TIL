//
//  Bindable.swift
//  MVVMPractice2
//
//  Created by 김지나 on 2023/07/16.
//

import Foundation

class Bindable<T> {
    private var listener: ((T) -> Void)?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        self.listener = closure
    }
    
    func bindAndFire(_ listener: @escaping (T) -> Void) {
        self.listener = listener
        self.listener?(value)
    }
}
