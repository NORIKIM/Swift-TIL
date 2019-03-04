//
//  ViewController.swift
//  UI3
//
//  Created by 김지나 on 2017. 9. 26..
//  Copyright © 2017년 김지나. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    var tf: UITextField!
    var lb: UILabel!
    var okBtn: UIButton!
    var temp:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        okBtn = UIButton(frame: CGRect(x: 310, y: 40, width: 40, height: 40))
        okBtn.setTitle("ok", for: .normal)
        okBtn.addTarget(self, action: #selector(self.handlerokBtn(_sender:)), for: .touchUpInside)
        okBtn.backgroundColor = .black
        view.addSubview(okBtn)
        
        tf = UITextField(frame: CGRect(x: 10, y: 40, width: 300, height: 40))
        tf.borderStyle = .line
        tf.backgroundColor = .white
        tf.delegate = self
        tf.placeholder = "여기에 입력해"
        view.addSubview(tf)
        
        lb = UILabel(frame: CGRect(x: 10, y: 90, width: 300, height: 400))
        lb.numberOfLines = 0
        view.addSubview(lb)
        
        }

    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        tf.resignFirstResponder()
        return true
    }
    func handlerokBtn(_sender:UIButton) {
        
        temp += tf.text! + "\n"
        lb.text = temp
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

