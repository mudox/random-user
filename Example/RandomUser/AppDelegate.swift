//
//  AppDelegate.swift
//  RandomUser
//
//  Created by mudox on 11/14/2017.
//  Copyright (c) 2017 mudox. All rights reserved.
//

import UIKit

import Jack
import RandomUser


fileprivate let jack = Jack.with(levelOfThisFile: .verbose)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
//  var disposeBag = DisposeBag()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//    let randomUser = MoyaProvider<APITarget>()
//    randomUser.rx.request(.users(count: 2)).subscribe {
//      switch $0 {
//      case .success(let response):
//        do {
//          let apiResponse = try JSONDecoder().decode(APIResponse.self, from: response.data)
//          dump(apiResponse.results)
//        } catch {
//          print("JSON decoding error: \(error)")
//        }
//      case .error(let error):
//        print("request error: \(error)")
//      }
//    }.disposed(by: disposeBag)

//    let users = RandomUserGenerator().users(count: 10)
//    var lines = ""
//    for (index, user) in users.enumerated() {
//      lines += ("""
//      \n[\(index)] \(user.name.first) \(user.name.last)
//        - gender: \(user.gender)
//        - email: \(user.email)
//      """)
//    }
//    jack.info("""
//      generated \(users.count) users
//      \(lines)
//    """)


    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

