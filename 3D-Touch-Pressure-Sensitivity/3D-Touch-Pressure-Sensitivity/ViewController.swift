//
//  ViewController.swift
//  3D-Touch-Pressure-Sensitivity
//
//  Created by Alex Zimin on 14/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var supportedLabel: UILabel!
  @IBOutlet weak var maxLevelLabel: UILabel!
  @IBOutlet weak var currentLavelLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if self.traitCollection.forceTouchCapability == .available {
      supportedLabel.text = "Supported: 1"
    }
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    let touch = touches.first
    
    self.maxLevelLabel.text = "Max level: \(String(format: "%.2f", touch?.maximumPossibleForce ?? 0))"
    changeCurrent(touch?.force ?? 0)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    
    let touch = touches.first
    changeCurrent(touch?.force ?? 0)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    changeCurrent(0)
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    changeCurrent(0)
  }
  
  func changeCurrent(_ value: CGFloat) {
    self.currentLavelLabel.text = "Current level: \(String(format: "%.2f", value))"
  }

}

