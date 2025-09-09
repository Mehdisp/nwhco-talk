import UIKit
import AVFoundation
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: "habibapp.com/channel",
                                                    binaryMessenger: controller.binaryMessenger)
        methodChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            result(0)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(60*120))
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

