import Flutter
import UIKit

public class BaseDialogPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "base_dialog_plugin", binaryMessenger: registrar.messenger())
    let instance = BaseDialogPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)

    case "showAlertDialog":
      if let args = call.arguments as? [String: Any] {
        showAlertDialog(args: args, result: result)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected arguments", details: nil))
      }

    case "showActionDialog":
      if let args = call.arguments as? [String: Any] {
        showActionDialog(args: args, result: result)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected arguments", details: nil))
      }

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func showAlertDialog(args: [String: Any], result: @escaping FlutterResult) {
    DispatchQueue.main.async {
      guard let rootVC = self.getRootViewController() else {
        result(FlutterError(code: "NO_ROOT_VC", message: "Could not find root view controller", details: nil))
        return
      }

      let title = args["title"] as? String
      let message = args["message"] as? String
      let buttonText = args["buttonText"] as? String ?? "OK"

      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
      let action = UIAlertAction(title: buttonText, style: .default) { _ in
        result(true)
      }
      
      alert.addAction(action)
      rootVC.present(alert, animated: true)
    }
  }

  private func showActionDialog(args: [String: Any], result: @escaping FlutterResult) {
    DispatchQueue.main.async {
      guard let rootVC = self.getRootViewController() else {
        result(FlutterError(code: "NO_ROOT_VC", message: "Could not find root view controller", details: nil))
        return
      }

      let title = args["title"] as? String
      let message = args["message"] as? String
      let buttonTextLeft = args["buttonTextLeft"] as? String ?? "Cancel"
      let buttonTextRight = args["buttonTextRight"] as? String ?? "OK"

      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
      let leftAction = UIAlertAction(title: buttonTextLeft, style: .cancel) { _ in
        result("left")
      }
      
      let rightAction = UIAlertAction(title: buttonTextRight, style: .default) { _ in
        result("right")
      }
      
      alert.addAction(leftAction)
      alert.addAction(rightAction)
      rootVC.present(alert, animated: true)
    }
  }

  private func getRootViewController() -> UIViewController? {
    if #available(iOS 13.0, *) {
      let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
      return windowScene?.windows.first?.rootViewController
    } else {
      return UIApplication.shared.keyWindow?.rootViewController
    }
  }
}