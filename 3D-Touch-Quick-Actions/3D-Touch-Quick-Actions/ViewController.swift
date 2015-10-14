//
//  ViewController.swift
//  3D-Touch-Quick-Actions
//
//  Created by Alex Zimin on 14/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func setupShortcutAction(sender: AnyObject) {
    let alertController = UIAlertController(title: "Setup shorcut action", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
    
    let addAction = UIAlertAction(title: "Add", style: .Default) { (_) in
      let titleTextField = alertController.textFields![0] as UITextField
      let subtitleTextField = alertController.textFields![1] as UITextField
      
      self.setupShortcut(titleTextField.text ?? "Umpty", subtitle: subtitleTextField.text ?? "")
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
    
    alertController.addTextFieldWithConfigurationHandler { (textField) in
      textField.placeholder = "Title"
    }
    
    alertController.addTextFieldWithConfigurationHandler { (textField) in
      textField.placeholder = "Subtitle"
    }
    
    alertController.addAction(cancelAction)
    alertController.addAction(addAction)
    
    self.presentViewController(alertController, animated: true, completion: nil)
  }

  func setupShortcut(title: String, subtitle: String) {
    let shortcutExample = UIMutableApplicationShortcutItem(type: basicShortcutDynamicTypeString, localizedTitle: title)
    shortcutExample.icon = UIApplicationShortcutIcon(type: .Add) // inco of shortcut, will be discribed later
    shortcutExample.localizedSubtitle = subtitle
    shortcutExample.userInfo = ["TabIndex" : 2]
    
    // Update the application providing the initial 'dynamic' shortcut items.
    UIApplication.sharedApplication().shortcutItems = [shortcutExample]
  }
  
}

