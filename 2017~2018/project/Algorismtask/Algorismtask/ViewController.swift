//
//  ViewController.swift
//  Algorismtask
//
//  Created by 김지나 on 2017. 9. 21..
//  Copyright © 2017년 김지나. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(collatz(num: 6))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//  입력된 수가 짝수라면 2로 나누고, 홀수라면 3을 곱하고 1을 더한 다음,
//  결과로 나온 수에 같은 작업을 1이 될 때까지 반복할 경우 모든 수가 1이 된다는 추측입니다.
//  예를 들어, 입력된 수가 6이라면 6→3→10→5→16→8→4→2→1 이 되어 총 8번 만에 1이 됩니다.
//  collatz 함수를 만들어 입력된 수가 몇 번 만에 1이 되는지 반환해 주세요.
//  단, 500번을 반복해도 1이 되지 않는다면 –1을 반환해 주세요.
    
    func collatz(num: Int) -> Int {
        
        var inputNum = num  // 파라미터 num을 inputNum으로 대입하여 변수를 선언
        var resultValue:[Int] = []  // 몇 번 반복 했는지 알 수 있도록 값을 배열에 넣는 변수 선언
        
        if resultValue.count == 500 && inputNum != 1 {  // 500번 반복하고 1이 되지 않으면 // 모르겠음
            
            while inputNum != 1 {  // inputNum이 1이 아니면
                
                if inputNum % 2 == 0 {  // inputNum이 짝수면
                    inputNum = inputNum / 2  // 2로 나눠라
                }
                else {  // inputNum이 홀수면
                    inputNum = (inputNum * 3) + 1  // 3을 곱하고 1을 더해라
                }
                
                resultValue += [inputNum]  // 짝수와 홀수인지 구분하는 if문을 통해 나온 값을 resultValue 배열에 넣어라
                
            }
            
            return resultValue.count  // resultValue 배열의 인자 개수 반환
            
        }
        
        return -1  // 500번 반복하고 1이 되지 않으면 -1을 반환
        
    }
    
//  양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다.
//  예를들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다.
//  예를들어 n이 10, 12, 18이면 True를 리턴 11, 13이면 False를 리턴하면 됩니다.
//  Harshad함수는 양의 정수 n을 매개변수로 입력받습니다.
//  이 n이 하샤드수인지 아닌지 판단하는 함수를 완성하세요.

    func harsahd(n: Int) -> Bool {
        
        var inputN = n  // 파라미터 n을 inputN으로 변수 선언
        var remain = 0  // inputN을 10으로 나눈 나머지 값을 저장할 변수 선언
        var divide = 0  // inputN을 10으로 나눈 값을 저장할 변수 선언
        var sum = 0  // remain과 divide를 합한 값을 저장할 변수 선언
        
        divide += inputN / 10  // inputN을 10으로 나눈 값을 divide에 저장
        remain += inputN % 10  // inputN을 10으로 나눈 나머지 값을 remain에 저장
        sum = divide + remain  // divide와 remain의 값을 합하여 sum에 저장
        
        if  inputN % sum == 0 {  // inputN을 sum으로 나눈 나머지가 0이면
            return true  // 리턴 true
        }
        else {  // inputN을 sum으로 나눈 나머지가 0이 아니면
            return false  // 리턴 false
        }
        
    }
    
    //  시저 암호: 어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. A를 3만큼 밀면 D가 되고 z를 1만큼 밀면 a가 됩니다
    //  1. 함수 입력 : ceasar(data:[“a”, ”B”, ”C”, ”d”], keyNum:4)
    //  2. 결과 : [“e”, ”F”, ”G”, ”h”]
    
    func ceasar(data:[String], keyNum: Int) -> String {
        
        var inputAlp = data
        var saveinputAlpArray:[String] = []
        var lowerAlp = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        var upperAlp = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        
        
        for i in inputAlp {
            if lowerAlp == [i] {
            saveinputAlpArray = lowerAlp[i] + keyNum
            }
        }
    }
}
