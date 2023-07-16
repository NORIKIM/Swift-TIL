//
//  FriendsTableViewViewModel.swift
//  MVVMPractice2
//
//  Created by 김지나 on 2023/07/13.
//

import Foundation

enum FriendTableViewCellType {
    case normal(cellViewModel: FriendCellViewModel)
    case error(message: String)
    case empty
}

class FriendsTableViewModel {
    var showLoadingHud: Bindable = Bindable(false)
    let friendCells = Bindable([FriendTableViewCellType]())
    let appServerClient = AppServerClient()
    
    func getFriends() {
        showLoadingHud.value = true
        appServerClient.getFrieds { [weak self] result in
            self?.showLoadingHud.value = false
            switch result {
            case .success(let friends):
                guard friends.count > 0 else {
                    self!.friendCells.value = [.empty]
                    return
                }
                self!.friendCells.value = friends.flatMap { .normal(cellViewModel: $0 as FriendCellViewModel)}
            case .failure(let error):
                self?.friendCells.value = [.error(message: "Loading failed, check network connection")]
            }
        }
    }
}
