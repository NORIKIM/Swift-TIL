//
//  ViewController.swift
//  UI
//
//  Created by 김지나 on 2017. 9. 25..
//  Copyright © 2017년 김지나. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var offbtn: UIButton!
    var onbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        onbtn = UIButton(type: .system) // 괄호안은 커스텀 타입 //UIButtonType은 지워도됨
        onbtn.frame = CGRect(x: 20, y: 300, width: 100, height: 100)
        onbtn.setTitle("on", for: .normal) //text는 내가 원하는 버튼안의 텍스트
        onbtn.setTitle("highlight", for: .highlighted)
        onbtn.setTitle("selected", for: .selected)
        onbtn.setTitleColor(.yellow, for: .normal)
        onbtn.setTitleColor(.yellow, for: .highlighted)
        onbtn.setTitleColor(.yellow, for: .selected)
        onbtn.addTarget(self, action: #selector(self.onbtnAction(_:)), for: .touchUpInside)//self는 viewcontroller를 말한다
        onbtn.isSelected = true
//        onbtn.isUserInteractionEnabled = false
        onbtn.backgroundColor = .red // UIColor는 지워도 됨
        view.addSubview(onbtn)
        
        
        offbtn = UIButton(type: .system)
        offbtn.frame = CGRect(x: 120, y: 300, width: 100, height: 100)
        offbtn.setTitle("off", for: .normal)
        offbtn.setTitle("highlight", for: .highlighted)
        offbtn.setTitle("selected", for: .selected)
        offbtn.setTitleColor(.yellow, for: .normal)
        offbtn.setTitleColor(.blue, for: .highlighted)
        offbtn.setTitleColor(.blue, for: .selected)
        offbtn.addTarget(self, action: #selector(self.offbtnAction(_:)), for: .touchUpInside)
        offbtn.isSelected = true
//        offbtn.isUserInteractionEnabled = false
        offbtn.backgroundColor = .red
        view.addSubview(offbtn)
        
    }
    
    @objc func onbtnAction(_ sender:UIButton) {
        sender.isSelected = true
        sender.isUserInteractionEnabled = false
        //off버튼 풀어주기
        sender.isSelected = false
        sender.isUserInteractionEnabled = true
    }
    @objc func offbtnAction(_ sender:UIButton) {
        sender.isSelected = true
        sender.isUserInteractionEnabled = false
        //off버튼 풀어주기
        sender.isSelected = false
        sender.isUserInteractionEnabled = true
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

