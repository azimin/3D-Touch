//
//  ColorViewController.swift
//  3D-Touch-Peek-And-Pop-Storyboard
//
//  Created by Alex Zimin on 15/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

import UIKit

enum ColorViewState: String {
  case Present, Preview
}

// One class segue with differet apperance

class ColorViewController: UIViewController {
  
  var state: ColorViewState = .Present {
    didSet {
      // To avoid view loading in `prepareForSegue` if view not on UI yet
      if self.isViewLoaded() {
        navigationBar.hidden = state == .Preview
        infoLabel.text = state.rawValue
      }
    }
  }
  
  @IBOutlet weak var navigationBar: UINavigationBar!
  @IBOutlet weak var infoLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationBar.hidden = state == .Preview
    infoLabel.text = state.rawValue
  }
  
  @IBAction func closeButtonItemAction(sender: UIBarButtonItem) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
