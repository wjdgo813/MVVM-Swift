//
//  AppDelegate.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 5. 25..
//  Copyright © 2017년 JHH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        ViewController * rootViewController = [[ViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
        /* UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
        
        [self.window addSubview:navigationController.view];
        [self.window makeKeyAndVisible];
        
        */
        
//        let vc :ViewController = ViewController()
//        let nav : UINavigationController = UINavigationController(rootViewController: vc)
//        self.window?.addSubview(nav.view)
//        self.window?.makeKeyAndVisible()
        
        
//        let vc :ViewController = ViewController()
//        vc.navigationItem.title = "main"
//        let nav : UINavigationController = UINavigationController(rootViewController: vc)
//        
//        self.navController = nav;
//        
//        
//        self.window?.rootViewController = self.navController
//        self.window?.makeKeyAndVisible()
        
//        self.window?.addSubview((navController?.view)!)
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        
        
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
}

