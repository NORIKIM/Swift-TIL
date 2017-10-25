//
//  custom.swift
//  bank
//
//  Created by 김지나 on 2017. 9. 14..
//  Copyright © 2017년 김지나. All rights reserved.
//

//고객은 이름과 주소를 가질수 있고, 여러 개의 계좌를 가질 수 있다.
//고객은 자신이 가지고 있는 계좌에 든 금액의 총합을 구하는 기능을 가진다
class Custom {
    let name: String
    var address: String
    
    var acc: [Account] = [] //account의 인스턴스를 가진다
    
 
    init(name:String, address: String) {
        self.name = name
        self.address = address
    }
    
    func sumMoney() -> Int { //파라미터 안받는 이유=account 인스턴스를 받아왔으니까
        var total: Int = 0
        
        for i in acc {
            total += i.money //account의 금액들을 total에 집어넣어준다
        }
        return total
    }

}
