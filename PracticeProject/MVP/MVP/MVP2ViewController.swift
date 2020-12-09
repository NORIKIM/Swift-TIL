//
//  ViewController.swift
//  swiftPlayground
//
//  Created by 김지나 on 2020/11/16.
//  Copyright © 2020 김지나. All rights reserved.
//

import UIKit
import Foundation

struct Button {
    let color: String
    let description: String
}

class ButtonService {
    func buttonColor(color: String, callaback: (Button?) -> Void) {
        let buttons = [Button(color: "blue", description: "selected bule button"), Button(color: "green", description: "selected green button")]
        
        if let foundColorButton = buttons.first(where: {$0.color == color}) {
            callaback(foundColorButton)
        } else {
            callaback(nil)
        }
    }
}

protocol ButtonView: class {
    func displayButton(description : String)
}

class Presenter {
    let buttonService: ButtonService
    weak var view: ButtonView?
    
    init(buttonService: ButtonService) {
        self.buttonService = buttonService
    }
    
    func setView(buttonView: ButtonView?) {
        self.view = buttonView
    }
    
    func buttonSelect(color: String) {
        buttonService.buttonColor(color: color) {
            [weak self] button in
            if let button = button {
                self?.view?.displayButton(description: button.description)
            }
        }
    }
}

class MVP2ViewController: UIViewController, ButtonView {
    
    @IBOutlet weak var text: UILabel!
    let presenter = Presenter(buttonService: ButtonService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setView(buttonView: self)
    }
    
    @IBAction func blueButton(_ sender: Any) {
        presenter.buttonSelect(color: "blue")
    }
    
    @IBAction func greenButton(_ sender: Any) {
        presenter.buttonSelect(color: "green")
    }
    
    func displayButton(description: String) {
           text.text = description
    }
}


