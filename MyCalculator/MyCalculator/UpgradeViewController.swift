//
//  UpgradeViewController.swift
//  MyCalculator
//
//  Created by 김지나 on 2017. 9. 20..
//  Copyright © 2017년 김지나. All rights reserved.
//

import UIKit

class UpgradeViewController: UIViewController {

    @IBOutlet var displayLable:UILabel!
    
    //MARK: Property
    var operation:(Double, Double) -> Double?
    {
        didSet{
        displayNumber = nil
        }
    }
//
//    var watingNum:Double?
// 
//    
    var displayNumber: Double?
    {
        willSet{
            if let newValue = newValue
            {
                self.displayLable.text = String(newValue)
            }
        }
    }
    
    
    //MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    //MARK: - IBAction
//    //C를 누르면 displayLable에 입렵된 값들 0으로 초기화
//    @IBAction func clean(btn:UIButton) {
//    
//    
//    }
    
    
    
    
    //숫자 버튼
    @IBAction func btnClick(btn:UIButton) {
        let digit: Double = 10

        let inputNumber = Double(btn.tag)
        
        if let newNumber = displayNumber
        {
            displayNumber = (newNumber * digit) + inputNumber
        } else
        {
            displayNumber = inputNumber
        }
        
    }
    
//    //연산작동 할때 인풋값 1,2 와 연산기호 부르고 디스플레이 비우기
//    @IBAction func oper(btn:UIButton) {
//        
//        if let displayNum = displayNumber{
//            watingNum = displayNum
//        }
//        
//        guard let opSymbol = btn.titleLabel?.text else {return}
//        
//        switch opSymbol {
//            case "÷":
//                operation = div
//            case "*":
//                operation = multy
//            case "+":
//                operation = sum
//            case "-":
//                operation = minus
//            case "=":
//                print("나누기")
//                result(oper: operation!, calculNum: displayNum)
//            default:
//                print("has no symbol")
//        }
//        
//        watingNum = displayNum
//
//    }
//    func result(oper:(Double,Double) -> Double, calculNum:Double)
//    {
//        guard let watingNum = watingNum else {return}
//        displayNumber = oper(watingNum, calculNum)
//
//    }
//    //=누르면
//    @IBAction func equal(btn:UIButton) {
//    
//        
//    }
//
//    let sum = {(num1, num2) -> Double in num1 + num2}
//    let minus = {(num1, num2) -> Double in num1 - num2}
//    let multy = {(num1, num2) -> Double in num1 * num2}
//    let div = {(num1, num2) -> Double in num1 / num2}

}
