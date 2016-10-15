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
  
    if traitCollection.forceTouchCapability == .available {
      registerForPreviewing(with: self, sourceView: collectionView)
    } 
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "PresentItem", let color = sender as? UIColor {
      let colorViewController = segue.destination as? ColorViewController
      colorViewController?.color = color
    }
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return colors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    cell.backgroundColor = colors[(indexPath as NSIndexPath).row]
    return cell
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    self.performSegue(withIdentifier: "PresentItem", sender: colors[(indexPath as NSIndexPath).row])
  }
}

extension ViewController: UIViewControllerPreviewingDelegate {
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
    guard let indexPath = collectionView.indexPathForItem(at: location),
      let cell = collectionView.cellForItem(at: indexPath) else { return nil }
    
    guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "ColorViewController") as? ColorViewController else { return nil }
    
    detailViewController.preferredContentSize = CGSize(width: 300, height: 300)
    detailViewController.color = colors[(indexPath as NSIndexPath).row]
    previewingContext.sourceRect = cell.frame
    
    return detailViewController
  }
  
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
    show(viewControllerToCommit, sender: nil)
  }
}

