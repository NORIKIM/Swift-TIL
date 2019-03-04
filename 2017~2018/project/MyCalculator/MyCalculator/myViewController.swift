//1. 번호버튼 - didset,willset/ didplaynum에 값을 넣으면 didset부분에서 텍스트를 바꿈
//2. 연산 - 클로저
//3. =

import UIKit

class myViewController: UIViewController {
    
    @IBOutlet var displayLable:UILabel!

    var num1: Double = 0
    var num2: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clean(btn:UIButton) {
     displayLable.text = "0"
    }
    
    //숫자 버튼
    @IBAction func btnClick(btn:UIButton) {
        
        if displayLable.text == "0"{
            displayLable.text = ""
        }
        //displaylabel이 공란이 아니면 연산기호를 displayLabel에
        var inputNum = 0 {
            willSet{
                
                displayLable.text = displayLable.text! + String(newValue)
            }
        }
        inputNum = Int(btn.titleLabel!.text!)!
        
        
    }
    

    //연산작동 할때 인풋값 1,2 와 연산기호 부르고 디스플레이 비우기
    @IBAction func operationbtn(btn:UIButton) {
        
        
        
    }
    
    
   


    
    //=누르면
    @IBAction func equal(btn:UIButton) {
        
        let opSymbol = btn.titleLabel!.text!
        
        switch opSymbol {
        case "÷":
            displayLable.text = String(num1 / num2)
        case "*":
            displayLable.text = String(num1 * num2)
        case "+":
            displayLable.text = String(num1 + num2)
        case "-":
            displayLable.text = String(num1 - num2)
        default:
            displayLable.text = "no symbol"
        }
    }
    

}
