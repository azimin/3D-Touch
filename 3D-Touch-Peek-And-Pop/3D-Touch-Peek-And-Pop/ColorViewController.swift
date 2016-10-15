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
  
  var color: UIColor = UIColor.black {
    didSet {
      if self.isViewLoaded {
        colorView.backgroundColor = color
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    colorView.backgroundColor = color
    // Do any additional setup after loading the view.
  }
  
  override var previewActionItems: [UIPreviewActionItem] {
    let basicItem = UIPreviewAction(title: "Copy", style: .default) { (action, viewController) -> Void in
      print("Copy action")
    }
    
    let removeItem = UIPreviewAction(title: "Remove", style: .destructive) { (action, viewController) -> Void in
      print("Remove action")
    }
    
    let dublicateItem = UIPreviewAction(title: "Dublicate", style: .default) { (action, viewController) -> Void in
      print("Dublicate action")
    }
    
    let groupOfActions = UIPreviewActionGroup(title: "UI Actions...", style: .default, actions: [removeItem, dublicateItem])
    
    return [basicItem, groupOfActions]
  }

  
}
