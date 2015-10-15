//
//  ViewController.swift
//  3D-Touch-Peek-And-Pop-Storyboard
//
//  Created by Alex Zimin on 15/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "PreviewColor" {
      let colorViewController = segue.destinationViewController as? ColorViewController
      // Button will be configured in `viewDidLoad:`
      colorViewController?.state = .Preview
    }

    if segue.identifier == "PresentColor" {
      let colorViewController = segue.destinationViewController as? ColorViewController
      // Button will be configured in `didSet` of `state` property
      colorViewController?.state = .Present
    }
  }

}

