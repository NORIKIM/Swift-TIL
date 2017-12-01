# 

import UIKit

class ViewController: UIViewController {

    //잔액창
    @IBOutlet var displayAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //검정 금액, 기분 금액 값 저장
    var InputCost: [String] = ["5,000","10,000","50,000"]
    var saveInputCost:Int = 0
    var feelingCost: String = "0"
    var costButton: String = ""
    var feelingButton: String = ""
    let numberFormatter = NumberFormatter()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //검정 금액 버튼
    @IBAction func inputMoneyClick(btn:UIButton) {

        if  btn.currentTitle == InputCost[0] {
            displayAmount.text = changeIntToStr(new: InputCost[0], save: saveInputCost, opr: "+")
        }
        else if btn.currentTitle == InputCost[1] {
            displayAmount.text = changeIntToStr(new: InputCost[1], save: saveInputCost, opr: "+")
        }
        else if btn.currentTitle == InputCost[2] {
            displayAmount.text = changeIntToStr(new: InputCost[2], save: saveInputCost, opr: "+")
        }
        else {
        
        }
    }
    //돈넣으면 잔액창에 넣는 금액대로 합해주기
    func changeIntToStr(new:String, save: Int, opr:String) -> String {
        numberFormatter.numberStyle = .decimal
        var new = new
        var save = save
        new = new.replacingOccurrences(of: ",", with:"")
        if opr == "+" {
            save += Int(new)!
        }else{
            save -= Int(new)!
        }
        saveInputCost = save
        
        return numberFormatter.string(from: NSNumber(value:save))!
 
    }
    //기분 버튼
    @IBAction func feeling(feel:UIButton) {
        if saveInputCost > 10000 {
            if feel.currentTitle == "30,000원" {
                displayAmount.text = changeIntToStr(new: "30000", save: saveInputCost, opr: "-")
            } else if feel.currentTitle == "10,000원" {
                displayAmount.text = changeIntToStr(new: "10000", save: saveInputCost, opr: "-")

            } else if feel.currentTitle == "50,000원" {
                displayAmount.text = changeIntToStr(new: "50000", save: saveInputCost, opr: "-")

            } else if feel.currentTitle == "100,000원" {
                displayAmount.text = changeIntToStr(new: "100000", save: saveInputCost, opr: "-")

            }
        }
    }
    
    
    
}
