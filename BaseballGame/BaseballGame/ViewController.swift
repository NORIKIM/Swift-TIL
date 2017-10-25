//
//  ViewController.swift
//  BaseballGame
//
//  Created by 김지나 on 2017. 9. 21..
//  Copyright © 2017년 김지나. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var displayLable: UILabel!
    @IBOutlet var showNumber1: UILabel!
    @IBOutlet var showNumber2: UILabel!
    @IBOutlet var showNumber3: UILabel!
    @IBOutlet var printresult: UITextView!

//    private var isRunning: Bool = true
    
    var showNumList:[UILabel]?
    private var answerNumber: Int = 0
    private var secretNumber:[Int]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberButton(btn:UIButton) {
     //숫자버튼을 누른다
     //누른 해당 버튼의 숫자가 showNumber1 레이블에 표시된다.
//        showNumList = [UILabel]
        
        
        
        
    }
    
    @IBAction func startButton(resetbtn:UIButton) {
        
       answerNumber = makeRandomNumber()
        
    }
    
    
    //맨 뒤 showNum 부터 차례로 지워지게 만들기
    @IBAction func delete(delbtn:UIButton) {
        displayLable.text = ""
        
        
    }
    
    
    //showNum에 있는 숫자들 확인
    @IBAction func check(checkbtn:UIButton) {
    //showNum의 각 숫자들의 숫자와 자리 확인
    }
    
    func makeRandomNumber() -> Int {
        var randomNumberList:[Int] = []

        while randomNumberList.count < 3 {
        let randomNum = Int(arc4random_uniform(10))//0~99

        }
        return 123
    }
    
   //숫자 누르면 쇼넘에 ㅍ시
    //체크버튼 누르면 결과창에 결과, 텍스트뷰에 결과.쇼넘숫자 표시//만약 정답이라면 "정답!"
    //리셋버튼 누르면 결과장과 쇼넘 숫자 리셋
    
}

