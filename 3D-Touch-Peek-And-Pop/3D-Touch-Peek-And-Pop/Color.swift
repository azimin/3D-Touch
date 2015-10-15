//
//  Color.swift
//  3D-Touch-Peek-And-Pop
//
//  Created by Alex Zimin on 15/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

// Thanks to - https://github.com/yeahdongcn/UIColor-Hex-Swift

import UIKit

extension UIColor {
  static func getRandomColor() -> UIColor {
    let randomRed:CGFloat = CGFloat(drand48())
    let randomGreen:CGFloat = CGFloat(drand48())
    let randomBlue:CGFloat = CGFloat(drand48())
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
  }
}