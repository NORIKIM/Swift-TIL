//
//  ViewController.swift
//  MVP
//
//  Created by 김지나 on 2020/12/08.
//  Copyright © 2020 김지나. All rights reserved.
//

// 출처 : https://sodocumentation.net/ko/iios/topic/9467/mvp-아키텍처

import UIKit
import Foundation

// Model
// 개 종류
enum Breed: String {
    case bulldog = "Bulldog"
    case doberman = "Doberman"
    case labrador = "Labrador"
}

// 개 한마리의 이름, 종류, 나이
struct Dog {
    let name: String
    let breed: String
    let age: Int
}

// view protocol
protocol DoggyView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setDoggies(_ doggies: [Dog])
    func setEmpty()
}

// service
// 모델 데이터를 생성
typealias Result = ([Dog]) -> Void
class DoggyService {
    func deliverDoggies(_ result: @escaping Result) {
        let first = Dog(name: "a", breed: Breed.labrador.rawValue, age: 1)
        let sec = Dog(name: "b", breed: Breed.doberman.rawValue, age: 2)
        let third = Dog(name: "c", breed: Breed.labrador.rawValue, age: 3)
        let delay = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * 2)) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: delay) {
            result([first,sec,third])
        }
    }
}

// presenter
// 모델에서 데이터를 받아오고 뷰에게 데이터를 보내준다
class DogPresenter {
    fileprivate let dogService: DoggyService
    weak fileprivate var dogView: DoggyView?
    
    init(dogService: DoggyService) {
        self.dogService = dogService
    }
    
    func attachView(_ attach: Bool, view: DoggyView?) {
        if attach {
            dogView = nil
        } else {
            if let view = view {
                dogView = view
            }
        }
    }
    
    func getDogs() {
        self.dogView?.startLoading()
        dogService.deliverDoggies {
            [weak self] doggies in
            self?.dogView?.finishLoading()
            
            if doggies.count == 0 {
                self?.dogView?.setEmpty()
            } else {
                self?.dogView?.setDoggies(doggies.map {
                    return Dog(name: $0.name + " \($0.breed)", breed: $0.breed, age: $0.age)
                })
            }
        }
    }
}

// view
// 실질적으로 뷰에 데이터를 보여준다.
class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var emptyView: UIView?
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var spinner: UIActivityIndicatorView?
    
    fileprivate let dogPresenter = DogPresenter(dogService: DoggyService())
    fileprivate var dogsToDisplay = [Dog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = self
        spinner?.hidesWhenStopped = true
        dogPresenter.attachView(false, view: self)
        dogPresenter.getDogs()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsToDisplay.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let userViewData = dogsToDisplay[indexPath.row]
        
        cell.textLabel?.text = userViewData.name
        cell.detailTextLabel?.text = String(userViewData.age)
        
        return cell
    }
}

extension ViewController: DoggyView {
    func startLoading() {
        spinner?.startAnimating()
    }
    
    func finishLoading() {
        spinner?.stopAnimating()
    }
    
    func setDoggies(_ doggies: [Dog]) {
        dogsToDisplay = doggies
        tableView?.isHidden = false
        emptyView?.isHidden = true
        tableView?.reloadData()
    }
    
    func setEmpty() {
        tableView?.isHidden = true
        emptyView?.isHidden = false
    }
}





