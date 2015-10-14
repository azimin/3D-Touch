//
//  AppDelegate.swift
//  3D-Touch-Quick-Actions
//
//  Created by Alex Zimin on 14/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

import UIKit

let basicShortcutDynamicTypeString = "my_app_dynamic_basic_shortcut"
let basicShortcutStaticTypeString = "my_app_static_basic_shortcut"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
    if let shortcutItems = application.shortcutItems where shortcutItems.isEmpty {
      let shortcutExample = UIMutableApplicationShortcutItem(type: basicShortcutDynamicTypeString, localizedTitle: "Select 3rd tab")
      shortcutExample.localizedSubtitle = "Will select 3rd tab" // subtitle of shortcut
      shortcutExample.icon = UIApplicationShortcutIcon(type: .Add) // inco of shortcut, will be discribed later
      shortcutExample.userInfo = ["TabIndex": 2] // additional info, must be [String : NSSecureCoding]
      
      // Update the application providing the initial 'dynamic' shortcut items.
      application.shortcutItems = [shortcutExample]
    }
    
    return true
  }

  func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: Bool -> Void) {
    let handled = handleShortcutItem(shortcutItem)
    completionHandler(handled)
  }
  
  // MARK: - Handling
  
  func handleShortcutItem(shortcutItem: UIApplicationShortcutItem) -> Bool { 
    if shortcutItem.type != basicShortcutDynamicTypeString && shortcutItem.type != basicShortcutStaticTypeString  {
      return false
    }
    
    if let index = shortcutItem.userInfo?["TabIndex"] as? Int {
      (window?.rootViewController as? UITabBarController)?.selectedIndex = index
    }
    
    return true
  }

}

