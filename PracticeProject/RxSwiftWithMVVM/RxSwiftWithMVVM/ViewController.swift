//
//  ViewController.swift
//  RxSwiftWithMVVM
//
//  Created by 김지나 on 2023/07/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tb: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }

    private func registerCell() {
        tb.register(UINib(nibName: "SuperStarCell", bundle: nil), forCellReuseIdentifier: "SuperStarCell")
    }
    
    func configureTableView() {
        registerCell()
        tb.rowHeight = 90
    }

}

