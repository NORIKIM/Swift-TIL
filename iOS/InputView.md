# InputView

텍스트필드와 같이 키보드 입력이 필요한 상황에 inputView를 띄운다. (키보드가 올라오는 영역)

inputVIew의 컨트롤러 -> UIInputViewController

**inputView를 이용하여 데이트피커를 보여주자**

텍스트필드를 올리고 UIToolbar를 이용하여 done,cancle,datePicker가 보이도록 한다.

```swift
class ViewController: UIViewController {
    @IBOutlet weak var txtDatePicker: UITextField!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtDatePicker.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}

```

참고 : https://medium.com/@javedmultani16/uidatepicker-in-swift-3-and-swift-4-example-ios-eb8ce6e1e4ae