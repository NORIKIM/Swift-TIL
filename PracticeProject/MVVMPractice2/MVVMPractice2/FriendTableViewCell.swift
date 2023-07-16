//
//  FriendTableViewCell.swift
//  MVVMPractice2
//
//  Created by 김지나 on 2023/07/16.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var fullNameLB: UILabel!
    @IBOutlet weak var phonenumberLB: UILabel!
    
    var viewModel: FriendCellViewModel? {
        didSet {
            bindViewModel()
        }
    }

    private func bindViewModel() {
        fullNameLB.text = viewModel?.fullName
        phonenumberLB.text = viewModel?.phonenumberText
    }
}
