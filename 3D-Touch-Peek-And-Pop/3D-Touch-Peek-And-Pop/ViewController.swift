//
//  ViewController.swift
//  3D-Touch-Peek-And-Pop
//
//  Created by Alex Zimin on 14/10/15.
//  Copyright © 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  
  var colors: [UIColor] = {
    var result: [UIColor] = []
    for _ in 0..<50 {
      result.append(UIColor.getRandomColor())
    }
    return result
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    if traitCollection.forceTouchCapability == .Available {
      registerForPreviewingWithDelegate(self, sourceView: collectionView)
    } 
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "PresentItem", let color = sender as? UIColor {
      let colorViewController = segue.destinationViewController as? ColorViewController
      colorViewController?.color = color
    }
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return colors.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
    cell.backgroundColor = colors[indexPath.row]
    return cell
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    self.performSegueWithIdentifier("PresentItem", sender: colors[indexPath.row])
  }
}

extension ViewController: UIViewControllerPreviewingDelegate {
  func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
    guard let indexPath = collectionView.indexPathForItemAtPoint(location),
      cell = collectionView.cellForItemAtIndexPath(indexPath) else { return nil }
    
    guard let detailViewController = storyboard?.instantiateViewControllerWithIdentifier("ColorViewController") as? ColorViewController else { return nil }
    
    detailViewController.preferredContentSize = CGSize(width: 300, height: 300)
    detailViewController.color = colors[indexPath.row]
    previewingContext.sourceRect = cell.frame
    
    return detailViewController
  }
  
  func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
    showViewController(viewControllerToCommit, sender: nil)
  }
}

