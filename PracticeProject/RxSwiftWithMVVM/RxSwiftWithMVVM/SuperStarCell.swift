//
//  SuperStarCell.swift
//  RxSwiftWithMVVM
//
//  Created by 김지나 on 2023/07/16.
//

import UIKit

class SuperStarCell: UITableViewCell {
    @IBOutlet weak var clubLB: UILabel!
    @IBOutlet weak var nameLB: UILabel!
    
    var superStar: SuperStar? {
        didSet {
            guard let superStar = superStar else { return }
            self.nameLB.text = superStar.name
            self.clubLB.text = superStar.club
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
}
