//
//  SignupViewController.swift
//  Login
//
//  Created by 김지나 on 2017. 9. 27..
//  Copyright © 2017년 김지나. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet var usernamesignup:UITextField!
    @IBOutlet var passwordsignup:UITextField!
    @IBOutlet var repasswordsignup:UITextField!
    
    var didTaskClosure: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernamesignup.addTarget(self, action: #selector(didEndonExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        passwordsignup.addTarget(self, action: #selector(didEndonExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        repasswordsignup.addTarget(self, action: #selector(didEndonExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        
    }
    
    @objc func didEndonExit(_ sender:UITextField) {
        
        if sender === usernamesignup {
            passwordsignup.becomeFirstResponder()
        } else if sender === passwordsignup {
            repasswordsignup.becomeFirstResponder()
        }
    }
    
    @IBAction func didTabSignup(_sender:UIButton) {
        guard let username = usernamesignup.text else { return }
        guard let password = passwordsignup.text else { return }
        guard let repassword = repasswordsignup.text else { return }
        
        //입력받은 패스워드 두개의 문자열이 같은지 비교
        if password == repassword {
            didTaskClosure?(username, password)
            dismiss(animated: true, completion: nil)
        } else {
            print("회원가입 실패")
        }
      
    }
    @IBAction func didTapExitButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
