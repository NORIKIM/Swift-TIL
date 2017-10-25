//
//  UpdateViewController.swift
//  BaseballGame
//
//  Created by 김지나 on 2017. 9. 23..
//  Copyright © 2017년 김지나. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    //MARK : Property
    private var isRunning:Bool = false
    private var selectNumLBList:[UILabel]?
    private var selectedNumberList:[Int] = []
    private var secretNumberList:[Int] = []
    
    
    
    //MARK : UIOutlet
    @IBOutlet weak var displayLB: UILabel!
    @IBOutlet weak var selecNum1LB: UILabel!
    @IBOutlet weak var selecNum2LB: UILabel!
    @IBOutlet weak var selecNum3LB: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    
    //MARK : UIAction
    /*
     1. 시작 버튼
     - 랜덤으로 3자리 숫자 생성 : 중복 숫자 제거 로직
     
     - 게임 종료까지 리셋 버튼으로 텍스트 변경
     */
    
    //시작 버튼
    @IBAction func handleStartBtn(_ sender: UIButton) {
        //- 게임 시작상태 변경
        isRunning = true
        
        secretNumberList = makeRandomNumber()
        //텍스트 변경
        
        //test
//        historyTextView.text = "\(secretNumberList)"
        
        clear()
    }
    
    /*
     2. 숫자 버튼 클릭
     - 결과 레이블에 추가
     - 레이블이 각각 다른 인스턴스 인데 어떻게 추가해야되나?
     - 중복 숫자 입력 방지
     */
    
    //숫자 입력
    @IBAction func handleInputNumBtn(_ sender: UIButton) {
        
        
        guard let checkLBList = selectNumLBList else {return}
        
        let selectedNum = sender.tag
        
        if isRunning && selectedNumberList.count < checkLBList.count && !selectedNumberList.contains(selectedNum)//실행중이고 selectedNumberList의 개수가 checkLBList개수와 selectedNumberList에 포함되어 있는 것 보다 작으면
        {
            selectedNumberList.append(selectedNum)
            let lastIndex = selectedNumberList.count - 1
            
            let inputLB = checkLBList[lastIndex]
            inputLB.text = "\(selectedNum)"
        }
    }
    
    
    //input된 숫자 지우기
    @IBAction func handleRemoveBtn(_ sender: UIButton) {
        if isRunning
        {
            clear()
        }
    }
    
    
    /*
     3. 체크버튼 클릭
     - 결과 확인 로직
     - 맞춤 : 성공 메세지 출력 : 몇번 만에 맞췄는지 알려준다.
     # : 게임이 대기 상태로 전환 된다.
     - 못맞춤 : 현재 게임 스코어 출력
     
     
     - 결과를 textView에 표시
     
     - 게임 대기중 입력 방지
     */
    //결과 확인 버튼
    @IBAction func handleCheckBtn(_ sender: UIButton) {
        if isRunning && selectedNumberList.count == secretNumberList.count
        {
            let score = checkAnswer(answer:selectedNumberList, correctAnswer: secretNumberList)
            if score == "3S "
            {
                displayLB.text = "정답입니다."
            }
            else
            {
                displayLB.text = "\(score)"
                addHistory(answer: selectedNumberList, score: score)
            }
            clear()
        }
    }
    
    
    
    //MARK : - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectNumLBList = [selecNum1LB,selecNum2LB,selecNum3LB]
        
    }
    
    
    //MARK : - Private Method
    private func makeRandomNumber() -> [Int]
    {
        var randomNumberList:[Int] = []
        
        
        while randomNumberList.count < 3
        {
            let randomNum:Int = Int(arc4random_uniform(10))
            if !randomNumberList.contains(randomNum)
            {
                randomNumberList.append(randomNum)
            }
            
        }
        
        return randomNumberList
    }
    private func clear()
    {
        guard let  selectNumLBList = selectNumLBList else {return}
        selectedNumberList = []
        for lb in selectNumLBList
        {
            lb.text = "0"
        }
    }
    /* 결과 확인
     #룰 : S는 결과에 포함되고 자릿수 가 같은,
     B은 결과에 포함은 됐지만 자릿수가 같지 않음.
     O은 결과에 포함도 되지 않음
     #로직 :  레이블의 숫자를 하나씩 가져와서 결과에 포함되어 있는지 확인, 그리고 자리수가 같은지 다시한번 확인
     */
    private func checkAnswer(answer:[Int], correctAnswer:[Int]) -> String
    {
        var strikeCount:Int = 0
        var ballCount:Int = 0
        var outCount:Int = 0
        
        for count in 0..<answer.count
        {
            let checkNum = answer[count]
            if correctAnswer.contains(checkNum)
            {
                if correctAnswer[count] == checkNum
                {
                    strikeCount += 1
                }else
                {
                    ballCount += 1
                }
            }else
            {
                outCount += 1
            }
        }
        
        //make result Str
        var resultStr:String = ""
        if strikeCount > 0
        {
            resultStr += "\(strikeCount)S "
        }
        
        if ballCount > 0
        {
            resultStr += "\(ballCount)B "
        }
        
        if outCount > 0
        {
            resultStr += "\(outCount)O "
        }
        
        return resultStr
    }
    private var historyText:String = ""
    
    private func addHistory(answer:[Int], score:String)
    {
        //answer -> Int로 변경하기
        let answerStr = changeStrFrom(list:answer)
        let text = answerStr + "의 결과 값은 \(score)입니다."
        
        //저장
        historyText += text + "\n"
        historyTextView.text = historyText
    }
    
    func changeStrFrom(list:[Int]) -> String
    {
        var returnStr = ""
        for num in list
        {
            returnStr += "\(num)"
        }
        return returnStr
    }

}
