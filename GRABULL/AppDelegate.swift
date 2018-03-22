//
//  AppDelegate.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import TwitterCore
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    
    
    
    var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    //CORE DATA methods
    
    
    
    
    //ENDED
    
    
    
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return Twitter.sharedInstance().application(app, open: url, options: options)
        
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.sharedManager().enable = true
        
        
        //Twitter
        /*Twitter.sharedInstance().start(with: kTwitterConsumerKey, consumerSecret: kTwitterConsumerSecret)
        Fabric.with([Twitter.sharedInstance()])*/
        //http://www.brewit9.com/2017/10/twitter-login-integration-in-ios-using.html
        Twitter.sharedInstance().start(withConsumerKey:kTwitterConsumerKey, consumerSecret:kTwitterConsumerSecret)

        
        
        
        /*if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            // For iOS 10 data message (sent via FCM
            Messaging.messaging().remoteMessageDelegate = self
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }*/
        
        
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        /*if let data = UserDefaults.standard.data(forKey: MyDuniaUserDetails),
            let _ = NSKeyedUnarchiver.unarchiveObject(with: data) as? User {
         */
       // let userId = DefaultDataManager.getUserId()
        
      //  if userId != "" {
            
            let mainStoryBoard = UIStoryboard(name: "TabBar", bundle: nil)
            let tabController = mainStoryBoard.instantiateViewController(withIdentifier: "TabBarControl") as! TabBarControl
            tabController.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = tabController
            
            print("Already Loged in")
        /*} else {
            let mainStoryBoard = UIStoryboard(name: "Login", bundle: nil)
            let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            let navController = UINavigationController(rootViewController: ViewController)
            ViewController.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navController
        }*/
        
        
        //Set navigation color
        UINavigationBar.appearance().barTintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)//UIColor.hexStringToUIColor(hex: MyDunia_colorPrimary)
        UIBarButtonItem.appearance().tintColor = .white//UIColor.hexStringToUIColor(hex: MyDunia_navigationTitleColor)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]//UIColor.hexStringToUIColor(hex: MyDunia_navigationTitleColor)]
        
        
        
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "GRABULL")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    
    
    
    
    
    //Push Notifications
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Registration failed!")
    }
    
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        //DefaultDataManager.SaveDeviceToken(deviceTokenString)
        print("didRegisterForRemoteNotificationsWithDeviceToken \(deviceTokenString)")
        
    }
    
   
    
     func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
    
    
    
    
}


extension UINavigationController
{
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


enum UIUserInterfaceIdiom : Int
{
    case Unspecified
    case Phone
    case Pad
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}
