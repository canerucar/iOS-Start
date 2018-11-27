//
//  AppDelegate.swift
//  IQKeyboardManager
//
//  Created by Caner Uçar on 21.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
         IQKeyboardManager.shared.enable = true
         IQKeyboardManager.shared.enableAutoToolbar = true
//        Gece modunda çalışan bir uygulama yapıyorsanız IQKeyboardManager’ın size göre bir teması var! Aşağıdaki satırlarla aktif edebilir, diğer temalarla değiştirebilirsiniz.
         IQKeyboardManager.shared.overrideKeyboardAppearance = true
         IQKeyboardManager.shared.keyboardAppearance = .dark
        
//        İstersek textField’tan uzaklığını aşağıdaki satırla değiştirebilirsiniz.
    
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 96.0
        
//        Toolbar’daki “Done” yazısını aşağıdaki satır sayesinde değiştirebiliyoruz.
        
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Kapat"
        
        
//        İsterseniz “Done” butonu yerine bir görsel atayabilirsiniz. Assets’e görseli attıktan sonra sağ taraftan Image Set içinden “Render as: Original Image” olarak işaretlemeyi unutmayın. O da şöyle oluyor:
        
       // IQKeyboardManager.shared.toolbarDoneBarButtonItemImage = UIImage(named: "x")
        
//        UITextField/UITextView’ın dışında herhangi bir yere tıklandığında klavyenin gitmesini istiyorsanız aşağıdaki satırı yazmanız yeterli olacaktır.
        
        
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

