# 
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayLable:UILabel!
    
    //처음 인풋받는 숫자, 연산자 기호, 두번째 인풋 받는 숫자 저장 변수 선언
    var firstInputNum: Double = 0
    var ope: String = ""
    var secondInputNum: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //C를 누르면 displayLable에 입렵된 값들 0으로 초기화
    @IBAction func clean(btn:UIButton) {
        displayLable.text = "0"
        ope = ""
    }
    
    //숫자 버튼
    @IBAction func btnClick(btn:UIButton) {
       //displayLabel 값이 0이면 공란으로 바꾸기
        
        if displayLable.text == "0" {
            displayLable.text = ""
        }
        //displaylabel이 공란이 아니면 연산기호를 displayLabel에
        if displayLable.text != "" {
            (displayLable.text)! += (btn.titleLabel!.text)!
        } else {//공란이면
            displayLable.text = btn.titleLabel!.text
        }
        
        //연속계산을 위한 값 저장소 변경(ex.2+3+4)
        if firstInputNum != 0 {
            secondInputNum = Double(displayLable.text!)!
        }
        
    }
    //연산작동 할때 인풋값 1,2 와 연산기호 부르고 디스플레이 비우기
    @IBAction func oper(btn:UIButton) {
       
        firstInputNum = Double(displayLable.text!)!
        ope = (btn.titleLabel?.text!)!
        displayLable.text = ""
        secondInputNum = 0//연속계산을 위한 초기화
    }
    
    //=누르면
    @IBAction func equal(btn:UIButton) {
        //결과 값을 0으로 초기화
        var result: Double = 0.0
        print(result)
        //ope의 문자가 플러스,마이너스,곱하기,나누기 일 때
        if ope == "+"{
            result = plus(save: firstInputNum, new: secondInputNum)
        }else if ope == "-"{
            result = minus(save: firstInputNum, new: secondInputNum)
            
        }else if ope == "×"{
            result = cross(save: firstInputNum, new: secondInputNum)
            
        }else if ope == "÷"{
            result = div(save: firstInputNum, new: secondInputNum)
            
        }else {
            
        }
        //디스플레이레이블에 결과값을 스트링으로
        displayLable.text = String(result)
    }
    
    //연산함수들
    func plus(save:Double, new:Double) -> Double {
        ope = "" //연속계산을 위한 연산기호 초기화
        return save + new
    }
    func minus(save:Double, new:Double) -> Double {
        ope = ""
        return save - new
    }
    func cross(save:Double, new:Double) -> Double {
        ope = ""
        return save * new
    }
    func div(save:Double, new:Double) -> Double {
        ope = ""
        return save / new
    }
}
