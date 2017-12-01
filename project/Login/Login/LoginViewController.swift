

import UIKit

class LoginViewController: UIViewController {
    
    // [[]]배열을 가지고 있는 배열(배열안에 여러 배열을 가질 수 있다)
//    var userModel:[[String]] = [["Fast","1234"],["Fast","1234"],["Fast","1234"]]
    
    //사용자 정보가 많아질 것을 대비하여 배열이 아닌 딕셔너리를 사용한다.
    var userModel = UserModel()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.addTarget(self, action: #selector(didEndonExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        passwordTextField.addTarget(self, action: #selector(didEndonExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        
    }
    //로그인 페이지의 내용을 가입페이지에 내용을 갖도록 클로저사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? SignupViewController {
            nextViewController.didTaskClosure = {
                (name: String, password: String) -> Void in
                self.userModel.addUser(name: name, password: password)
            }
        }
    }
    
    @objc func didEndonExit(_ sender:UITextField) {
        
        if sender === usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
    }

    @IBAction func didTabLoginButton(_ sender: UIButton) {
    
        guard let username = usernameTextField.text, !username.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        
        // if let 사용시 작성 예
//        if let username = usernameTextField.text {
//            if let password = passwordTextField.text {
//                
//            } else {
//                
//            }
//        } else {
//            
//        }
//        
//    }
        
        let isLoginSuccess: Bool = userModel.findUser(name : username, password: password)
        if isLoginSuccess {
            print("로그인성공")
            let main = MainViewController()
            present(main, animated: true, completion: nil)
        } else {
//            usernameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
//            passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            UIView.animate(withDuration: 1.0, animations: {
                self.usernameTextField.frame.origin.x -= 10
                self.passwordTextField.frame.origin.x -= 10
            }, completion: { _ in
                UIView.animate(withDuration: 1.0, animations: { 
                    self.usernameTextField.frame.origin.x += 20
                    self.passwordTextField.frame.origin.x += 20
                }, completion: { _ in
                    UIView.animate(withDuration: 1.0, animations: { 
                        self.usernameTextField.frame.origin.x -= 10
                        self.passwordTextField.frame.origin.x -= 10
                    })
            })
        })
        }  

}
}
