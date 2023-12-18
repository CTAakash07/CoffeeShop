import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSService.provideAPIKey("AIzaSyAwPdouU6ShPVXwogtI0dEW9fLN-J7x2GI")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
