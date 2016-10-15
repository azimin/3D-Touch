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
  
  @IBAction func setupShortcutAction(_ sender: AnyObject) {
    let alertController = UIAlertController(title: "Setup shorcut action", message: nil, preferredStyle: UIAlertControllerStyle.alert)
    
    let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
      let titleTextField = alertController.textFields![0] as UITextField
      let subtitleTextField = alertController.textFields![1] as UITextField
      
      self.setupShortcut(titleTextField.text ?? "Umpty", subtitle: subtitleTextField.text ?? "")
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
    
    alertController.addTextField { (textField) in
      textField.placeholder = "Title"
    }
    
    alertController.addTextField { (textField) in
      textField.placeholder = "Subtitle"
    }
    
    alertController.addAction(cancelAction)
    alertController.addAction(addAction)
    
    self.present(alertController, animated: true, completion: nil)
  }

  func setupShortcut(_ title: String, subtitle: String) {
    let shortcutExample = UIMutableApplicationShortcutItem(type: basicShortcutDynamicTypeString, localizedTitle: title)
    shortcutExample.icon = UIApplicationShortcutIcon(type: .add) // inco of shortcut, will be discribed later
    shortcutExample.localizedSubtitle = subtitle
    shortcutExample.userInfo = ["TabIndex" : 2 as NSSecureCoding]
    
    // Update the application providing the initial 'dynamic' shortcut items.
    UIApplication.shared.shortcutItems = [shortcutExample]
  }
  
}

