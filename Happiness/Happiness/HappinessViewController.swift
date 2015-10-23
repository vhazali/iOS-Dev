//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Victor Hazali on 19/10/15.
//  Copyright © 2015 Victor Hazali. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    @IBOutlet weak var faceView: FaceView! {
        didSet{
            faceView.dataSource = self
        }
    }
    var happiness : Int = 100 {// 0 is very sad, 100 is ecstatic
        didSet{
            happiness = min(max(happiness,0),100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    private func updateUI() {
        faceView.setNeedsDisplay()
    }
    func smilinessForFaceiew(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}
