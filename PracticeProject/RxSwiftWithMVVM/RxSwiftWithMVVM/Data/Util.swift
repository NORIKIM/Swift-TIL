//
//  Util.swift
//  RxSwiftWithMVVM
//
//  Created by 김지나 on 2023/07/16.
//

import Foundation

final class Utilities {
    static func createData() -> [SuperStar] {
        let ronaldo = SuperStar(name: "Cristiano Ronaldo", club: "Real Madrid", avator: "ronaldo")
        let messi = SuperStar(name: "Leonel Messi", club: "Barcelona", avator: "messi")
        let torres = SuperStar(name: "Fernando Torres", club: "Atletico Madrid", avator: "torres")
        return [ronaldo, messi, torres]
    }
}
