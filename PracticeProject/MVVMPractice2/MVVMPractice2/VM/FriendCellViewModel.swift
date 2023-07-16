//
//  FriendCellViewModel.swift
//  MVVMPractice2
//
//  Created by 김지나 on 2023/07/16.
//

import Foundation

protocol FriendCellViewModel {
    var friendItem: Friend { get }
    var fullName: String { get }
    var phonenumberText: String { get }
}

extension Friend: FriendCellViewModel {
    var friendItem: Friend {
        return self
    }
    var fullName: String {
        return name
    }
    var phonenumberText: String {
        return email
    }
}
