//
//  ColorViewController.swift
//  3D-Touch-Peek-And-Pop
//
//  Created by Alex Zimin on 15/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
  
  @IBOutlet weak var colorView: UIView!
  
  var color: UIColor = UIColor.blackColor() {
    didSet {
      if self.isViewLoaded() {
        colorView.backgroundColor = color
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    colorView.backgroundColor = color
    // Do any additional setup after loading the view.
  }
  
  override func previewActionItems() -> [UIPreviewActionItem] {
    let basicItem = UIPreviewAction(title: "Copy", style: .Default) { (action, viewController) -> Void in
      print("Copy action")
    }
    
    let removeItem = UIPreviewAction(title: "Remove", style: .Destructive) { (action, viewController) -> Void in
      print("Remove action")
    }
    
    let dublicateItem = UIPreviewAction(title: "Dublicate", style: .Default) { (action, viewController) -> Void in
      print("Dublicate action")
    }
    
    let groupOfActions = UIPreviewActionGroup(title: "UI Actions...", style: .Default, actions: [removeItem, dublicateItem])
    
    return [basicItem, groupOfActions]
  }

  
}
