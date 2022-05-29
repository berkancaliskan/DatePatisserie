//
//  AppDelegate.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 24.03.2022.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth
//import OneSignal
import OneSignalServicesExtension


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        getDailyFood()
        rememberUser()
        
        
        // OneSignal initialization
        //      OneSignal.initWithLaunchOptions(launchOptions, appId: "6fca0160-024a-43a4-9a78-33caa5cd8cd4")
        
        
        
        // promptForPushNotifications will show the native iOS notification permission prompt.
        // We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 8)
        //      OneSignal.promptForPushNotifications(userResponse: { accepted in
        //        print("User accepted notifications: \(accepted)")
        //
        //      })
        
        return true
    }
    
    func configureWindow(destinationVC : UIViewController){
    
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        window?.rootViewController = destinationVC
    
    }
    
    func rememberUser(){
        
        if uDefaults.object(forKey: "user") != nil{
                        
            if Auth.auth().currentUser != nil{
                createProducts()
                
        
                configureWindow(destinationVC: StartVC())
                
            }else{
                //login
                configureWindow(destinationVC: LoginVC())
            }
        }else{
            configureWindow(destinationVC: Onboarding1VC())
        }
    }
}
