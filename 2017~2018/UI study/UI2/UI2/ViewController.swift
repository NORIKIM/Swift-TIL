//
//  ViewController.swift
//  UI2
//
//  Created by 김지나 on 2017. 9. 26..
//  Copyright © 2017년 김지나. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    //클릭하는 뷰 컬러 바꾸기 - 선언
//    var btn1: UIButton!
//    var btn2: UIButton!
//    var btn3: UIButton!
//    var btn4: UIButton!
//    var btn5: UIButton!
//    var btn6: UIButton!
//    var btn7: UIButton!
//    var btn8: UIButton!
//    var btn9: UIButton!
    
    //한 개 뷰 클릭하면 설정한 뷰들 컬러 바꾸기 - 선언
        var btn1: UIButton!
        var btn2: UIButton!
        var btn3: UIButton!
        var btn4: UIButton!
        var btn5: UIButton!
        var btn6: UIButton!
        var btn7: UIButton!
        var btn8: UIButton!
        var btn9: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //한 개 뷰 클릭하면 설정한 뷰들 컬러 바꾸기 - 뷰 설정
            btn1 = UIButton(type: .system)
            btn1.frame = CGRect(x: 0, y: 15, width: 125, height: 125)
            btn1.tag = 1
            btn1.setTitle("1", for: .normal)
            btn1.setTitleColor(.black, for: .normal)
            btn1.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn1.backgroundColor = .gray
            view.addSubview(btn1)

            btn2 = UIButton(type: .system)
            btn2.frame = CGRect(x: 125, y: 15, width: 125, height: 125)
            btn2.tag = 2
            btn2.setTitle("2", for: .normal)
            btn2.setTitleColor(.black, for: .normal)
            btn2.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn2.backgroundColor = .white
            view.addSubview(btn2)

            btn3 = UIButton(type: .system)
            btn3.frame = CGRect(x: 250, y: 15, width: 125, height: 125)
            btn3.tag = 3
            btn3.setTitle("3", for: .normal)
            btn3.setTitleColor(.black, for: .normal)
            btn3.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn3.backgroundColor = .gray
            view.addSubview(btn3)

            btn4 = UIButton(type: .system)
            btn4.frame = CGRect(x: 0, y: 140, width: 125, height: 125)
            btn4.tag = 4
            btn4.setTitle("4", for: .normal)
            btn4.setTitleColor(.black, for: .normal)
            btn4.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn4.backgroundColor = .white
            view.addSubview(btn4)

            btn5 = UIButton(type: .system)
            btn5.frame = CGRect(x: 125, y: 140, width: 125, height: 125)
            btn5.tag = 5
            btn5.setTitle("5", for: .normal)
            btn5.setTitleColor(.black, for: .normal)
            btn5.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn5.backgroundColor = .gray
            view.addSubview(btn5)

            btn6 = UIButton(type: .system)
            btn6.frame = CGRect(x: 250, y: 140, width: 125, height: 125)
            btn6.tag = 6
            btn6.setTitle("6", for: .normal)
            btn6.setTitleColor(.black, for: .normal)
            btn6.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn6.backgroundColor = .white
            view.addSubview(btn6)

            btn7 = UIButton(type: .system)
            btn7.frame = CGRect(x: 0, y: 265, width: 125, height: 125)
            btn7.tag = 7
            btn7.setTitle("7", for: .normal)
            btn7.setTitleColor(.black, for: .normal)
            btn7.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn7.backgroundColor = .gray
            view.addSubview(btn7)

            btn8 = UIButton(type: .system)
            btn8.frame = CGRect(x: 125, y: 265, width: 125, height: 125)
            btn8.tag = 8
            btn8.setTitle("8", for: .normal)
            btn8.setTitleColor(.black, for: .normal)
            btn8.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn8.backgroundColor = .white
            view.addSubview(btn8)
            
            btn9 = UIButton(type: .system)
            btn9.frame = CGRect(x: 250, y: 265, width: 125, height: 125)
            btn9.tag = 9
            btn9.setTitle("9", for: .normal)
            btn9.setTitleColor(.black, for: .normal)
            btn9.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn9.backgroundColor = .gray
            view.addSubview(btn9)
        
        
//        //클릭하는 뷰 컬러 바꾸기 - 뷰 설정
//        btn1 = UIButton(type: .system)
//        btn1.frame = CGRect(x: 0, y: 15, width: 125, height: 125)
//        btn1.tag = 1
//        btn1.setTitle("1", for: .normal)
//        btn1.setTitleColor(.black, for: .normal)
//        btn1.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn1.backgroundColor = .gray
//        view.addSubview(btn1)
//        
//        btn2 = UIButton(type: .system)
//        btn2.frame = CGRect(x: 125, y: 15, width: 125, height: 125)
//        btn2.tag = 2
//        btn2.setTitle("2", for: .normal)
//        btn2.setTitleColor(.black, for: .normal)
//        btn2.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn2.backgroundColor = .white
//        view.addSubview(btn2)
//        
//        btn3 = UIButton(type: .system)
//        btn3.frame = CGRect(x: 250, y: 15, width: 125, height: 125)
//        btn3.tag = 3
//        btn3.setTitle("3", for: .normal)
//        btn3.setTitleColor(.black, for: .normal)
//        btn3.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn3.backgroundColor = .gray
//        view.addSubview(btn3)
//        
//        btn4 = UIButton(type: .system)
//        btn4.frame = CGRect(x: 0, y: 140, width: 125, height: 125)
//        btn4.tag = 4
//        btn4.setTitle("4", for: .normal)
//        btn4.setTitleColor(.black, for: .normal)
//        btn4.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn4.backgroundColor = .white
//        view.addSubview(btn4)
//        
//        btn5 = UIButton(type: .system)
//        btn5.frame = CGRect(x: 125, y: 140, width: 125, height: 125)
//        btn5.tag = 5
//        btn5.setTitle("5", for: .normal)
//        btn5.setTitleColor(.black, for: .normal)
//        btn5.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn5.backgroundColor = .gray
//        view.addSubview(btn5)
//        
//        btn6 = UIButton(type: .system)
//        btn6.frame = CGRect(x: 250, y: 140, width: 125, height: 125)
//        btn6.tag = 6
//        btn6.setTitle("6", for: .normal)
//        btn6.setTitleColor(.black, for: .normal)
//        btn6.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn6.backgroundColor = .white
//        view.addSubview(btn6)
//        
//        btn7 = UIButton(type: .system)
//        btn7.frame = CGRect(x: 0, y: 265, width: 125, height: 125)
//        btn7.tag = 7
//        btn7.setTitle("7", for: .normal)
//        btn7.setTitleColor(.black, for: .normal)
//        btn7.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn7.backgroundColor = .gray
//        view.addSubview(btn7)
//        
//        btn8 = UIButton(type: .system)
//        btn8.frame = CGRect(x: 125, y: 265, width: 125, height: 125)
//        btn8.tag = 8
//        btn8.setTitle("8", for: .normal)
//        btn8.setTitleColor(.black, for: .normal)
//        btn8.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn8.backgroundColor = .white
//        view.addSubview(btn8)
//        
//        btn9 = UIButton(type: .system)
//        btn9.frame = CGRect(x: 250, y: 265, width: 125, height: 125)
//        btn9.tag = 9
//        btn9.setTitle("9", for: .normal)
//        btn9.setTitleColor(.black, for: .normal)
//        btn9.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
//        btn9.backgroundColor = .gray
//        view.addSubview(btn9)
    }
    
    //한 개 뷰 클릭하면 설정한 뷰들 컬러 바꾸기 - 이벤트
        @objc func btnAction(_ sender:UIButton) {
            let index:Int = sender.tag
            switch index {
            case 1:
                sender.backgroundColor = .white
            case 2:
                sender.backgroundColor = .yellow
            case 3:
                sender.backgroundColor = .white
            case 4:
                sender.backgroundColor = .yellow
            case 5:
                sender.backgroundColor = .white
            case 6:
                sender.backgroundColor = .yellow
            case 7:
                sender.backgroundColor = .white
            case 8:
                sender.backgroundColor = .yellow
            case 9:
                sender.backgroundColor = .white
            default:
                sender.backgroundColor = .blue
            }
    
        }

    
//    //클릭하면 뷰 컬러 바꾸기 - 이벤트
//    @objc func btnAction(_ sender:UIButton) {
//        let index:Int = sender.tag
//        switch index {
//        case 1:
//            sender.backgroundColor = .white
//        case 2:
//            sender.backgroundColor = .yellow
//        case 3:
//            sender.backgroundColor = .white
//        case 4:
//            sender.backgroundColor = .yellow
//        case 5:
//            sender.backgroundColor = .white
//        case 6:
//            sender.backgroundColor = .yellow
//        case 7:
//            sender.backgroundColor = .white
//        case 8:
//            sender.backgroundColor = .yellow
//        case 9:
//            sender.backgroundColor = .white
//        default:
//            sender.backgroundColor = .blue
//        }
//
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

