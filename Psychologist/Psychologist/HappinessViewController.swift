//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Victor Hazali on 19/10/15.
//  Copyright © 2015 Victor Hazali. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    var happiness : Int = 100 {// 0 is very sad, 100 is ecstatic
        didSet{
            happiness = min(max(happiness,0),100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    @IBOutlet weak var faceView: FaceView! {
        didSet{
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break;
        }
    }
    private func updateUI() {
        faceView?.setNeedsDisplay()
    }
    func smilinessForFaceiew(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}
