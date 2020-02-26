```swift
import UIKit
/*
NSObject : 상속받는 이유?
= NSObject가 체택하는 NSObjectProtocol을 사용하기 위함
= C언어를 기반으로 객체를 흉내네는 객체지향언어로, 객체로서 수행할 역할을 NSObject Class로 정의한다.(객체로서 행위를 할 수 있도록 해줌)
*/
class DataSourceObject: NSObject, UITableViewDataSource {
    private let defaultCellIdentifier: String = "defaultCell"
    
    // 테이블뷰의 섹션에 얼마만큼의 row를 보여줄 건지를 결정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 섹션이 0번째이면 5개의 row를 보여줘...
        return section == 0 ? 5 : (section + 1) * 5   
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
/*
UITableViewCell의 객체를 생성하지 않고 dequeueReusableCell를 사용하는 이유는??
: 앱 성능을 위해 메모리를 줄일 수 있다. 화면에 보이는 셀의 개수를 정해놓고 데이터 소스를 기반으로 내용을 변경해주는데, 화면에 보이는 셀에 대해서만 메모리를 할당하고 테이블 뷰를 스크롤하게 될때는 reuse pool에 넣고 dequeueReusableCell를 호출할 때 데이터 셀에 의해 반환이 된다.
: 메모리 할당에도 비용이 든다. 전부 저장해서 가지고 있는거에 비해 push pop push pop이 더 저렴!      
*/
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.defaultCellIdentifier, for: indexPath)
        
        // 섹션0,로우0이면 배경색을 빨간색으로 만들어 줘
        if indexPath.section == 0, indexPath.row == 0 {
            cell.backgroundColor = UIColor.red
        }
        
        cell.textLabel?.text = "section : \(indexPath.section), row: \(indexPath.row)"
        
        return cell
    }
    
}
```

```swift
import UIKit

class ViewController: UIViewController {
    private let dataSource: DataSourceObject = DataSourceObject()
    private let delegate: DelegateObject = DelegateObject()
    private let defaultCellIdentifier: String = "defaultCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
      // 테이블 뷰를 생성하고 
        let table: UITableView = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(table)
        
        //table.register(cellClass,forCellReuseIdentifier: String)
        table.register(UITableViewCell.self, forCellReuseIdentifier: self.defaultCellIdentifier)
        
        table.dataSource = self.dataSource
        table.delegate = self.delegate
        
        let constraints: [NSLayoutConstraint] = [
            table.topAnchor.constraint(equalTo: self.view.topAnchor),
        table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
```



## 2차 실습!!



XIB를 사용하여 테이블뷰의 셀을 등록하는 방법 : https://zeddios.tistory.com/297



## 값 넘겨주기

- Override prepare(for segue: UIStoryboardSegue, sender: Any?)

  선택한 셀의 정보를 다른 뷰로 넘겨주고 싶을 때 사용한다.

  값을 가지고 있는 테이블뷰 컨트롤러 위치에서 생성하여 다른뷰의 프로퍼티에 전달한다.

  ```swift
  // 선택한 도시의 상세 정보 넘겨주기
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let detailVC = segue.destination as! DetailViewController
    guard let indexPath = self.cityTableView.indexPathForSelectedRow else { return }
    let cell = cityTableView.cellForRow(at: indexPath) as! cityCellView
          
    detailVC.selectCity = cell.cityNameLB.text!
    
    detailVC.degree = cell.cityDegreeLB.text!
    
    detailVC.weather = cell.weatherImg.restorationIdentifier!
    
    detailVC.rainProbability = cell.cityRainProbabilityLB.text!
  }
  ```

  