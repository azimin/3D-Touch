//
//  ColorViewController.swift
//  3D-Touch-Peek-And-Pop-Storyboard
//
//  Created by Alex Zimin on 15/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

import UIKit

enum ColorViewState: String {
  case present, preview
}

// One class segue with differet apperance

class ColorViewController: UIViewController {
  
  var state: ColorViewState = .present {
    didSet {
      // To avoid view loading in `prepareForSegue` if view not on UI yet
      if self.isViewLoaded {
        navigationBar.isHidden = (state == .preview)
        infoLabel.text = state.rawValue
      }
    }
  }
  
  @IBOutlet weak var navigationBar: UINavigationBar!
  @IBOutlet weak var infoLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationBar.isHidden = state == .preview
    infoLabel.text = state.rawValue
  }
  
  @IBAction func closeButtonItemAction(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: nil)
  }
}
