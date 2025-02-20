import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        let toastChannel = FlutterMethodChannel(name: "com.example.matrix_rotation_app/toast",
                                                binaryMessenger: controller.binaryMessenger)

        toastChannel.setMethodCallHandler { (call, result) in
            if call.method == "showToast" {
                if let args = call.arguments as? [String: Any], let message = args["message"] as? String {
                    self.showToast(message: message)
                }
                result(nil)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func showToast(message: String) {
        DispatchQueue.main.async {
            let toast = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            toast.view.alpha = 0.6
            toast.view.layer.cornerRadius = 15

            let rootViewController = UIApplication.shared.keyWindow?.rootViewController
            rootViewController?.present(toast, animated: true)

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                toast.dismiss(animated: true)
            }
        }
    }
}
