//
//  account.swift
//  bank
//
//  Created by 김지나 on 2017. 9. 14..
//  Copyright © 2017년 김지나. All rights reserved.
//

class Account {
    let bankName: String
    var money: Int = 0
    init(bankName: String, money: Int) {
        self.bankName = bankName
        self.money = money
    }
  
}
