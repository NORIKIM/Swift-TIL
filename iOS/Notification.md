# Notification

## Alert

**AppDelegate**

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
```

**ViewController**

```swift
import UserNotifications

class ViewController: UIViewController {
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestNotificationAuthorization()
        sendNotification(seconds: 10)
    }

    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)

        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
            if let error = error {
                print("Error: \(error)")
            }
        }

    }

    func sendNotification(seconds: Double) {
        let notificationContent = UNMutableNotificationContent()

        notificationContent.title = "알림 테스트"
        notificationContent.body = "이것은 알림을 테스트 하는 것이다"

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)

        userNotificationCenter.add(request) { error in
            if let error = error {
                print("Notification Error: ", error)
            }
        }

    }
  
    
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
```

<img src="https://user-images.githubusercontent.com/31604976/95844484-ecd21580-0d83-11eb-8d6f-6ae09bd89d5c.PNG">

## Post

참고: https://baked-corn.tistory.com/42

특정 객체가 `NotificationCenter`에 등록된 `Event`를 발생시키면 해당`Observer`들이 행동을 취하는 것

즉, 특정 객체가 `Event`를 발생시키는 것을 `Post`라고 한다.

```swift
class AddViewController: UIViewController {
  @IBAction func saveButton(sender: UIButton) {
    NotificationCenter.default.post(
      name: NSNotificaion.Name(rawValue: "save"),
      object: nil
    )
  }
}
```

```swift
class MainViewController: UIViewController {
  override viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self,
      selector: #selector(printDB),
      name: NSNotification.Name(rawValue: "save"),
      object: nil
    )
  }
  @objc func printDB() {
    print("Updated Database")
  }
}
```

AddViewController의 save 버튼이 눌리면 noti가 post 되고, 이 noti를 받는 MainViewController에서 noti의 event인 printDB가 실행된다.