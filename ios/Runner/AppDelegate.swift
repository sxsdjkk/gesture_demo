import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    PlatformViewTestPlugin.register(with: self.registrar(forPlugin: "platform_view_test")!)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
