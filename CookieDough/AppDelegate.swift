//
//  AppDelegate.swift
//  CookieDough
//
//  Created by Zohaib on 5/15/19.
//  Copyright © 2019 Zohaib. All rights reserved.
//

import UIKit
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
        
        let notificationReceivedBlock: OSHandleNotificationReceivedBlock = { notification in
            
//            print("Received Notification: \(String(describing: notification!.payload.title))")
//            print("content_available = \(String(describing: notification!.payload.body))")
            
            let dataHandler = NotificationHandler(title: notification!.payload.title, body: notification!.payload.body)
            
//            var dataArray: [NotificationHandler] = []
//            dataArray.append(dataHandler)
            
            let placeData = UserDefaults.standard.data(forKey: "places")
            var placeArray = try! JSONDecoder().decode([NotificationHandler].self, from: placeData!)
            
            if (placeArray != nil && placeArray.count > 0) {
                placeArray.append(dataHandler)
                let notificationData = try! JSONEncoder().encode(placeArray)
                UserDefaults.standard.set(notificationData, forKey: "places")
            }
            else {
                var dataArray = [NotificationHandler]()
                dataArray.append(dataHandler)
                let notificationData = try! JSONEncoder().encode(dataArray)
                UserDefaults.standard.set(notificationData, forKey: "places")
            }
        }
        
        // Replace 'YOUR_APP_ID' with your OneSignal App ID.
        OneSignal.initWithLaunchOptions(launchOptions,
                                        appId: "cbddbe60-be6c-46b3-92d6-67ecdecddde0",
                                        handleNotificationReceived: notificationReceivedBlock, handleNotificationAction: nil,
                                        settings: onesignalInitSettings)
        
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
        
        // Recommend moving the below line to prompt for push after informing the user about
        //   how your app will use them.
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })
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

    func loadPlaces() {
        let placeData = UserDefaults.standard.data(forKey: "places")
        let placeArray = try! JSONDecoder().decode([NotificationHandler].self, from: placeData!)
        
        for place in placeArray {
            print("")
            print("Title: \(place.title)")
            print("Body: \(place.body)")
        }
    }
}

