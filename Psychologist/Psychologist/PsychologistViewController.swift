//
//  ViewController.swift
//  Psychologist
//
//  Created by Victor Hazali on 26/10/15.
//  Copyright © 2015 Victor Hazali. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    
    @IBAction func seeNothing(sender: UIButton) {
        performSegueWithIdentifier("showNothingDiagnosis", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "showHappyDiagnosis": hvc.happiness = 100
                    case "showSadDiagnosis": hvc.happiness = 0
                    case "showNothingDiagnosis": hvc.happiness = 60
                    default: hvc.happiness = 50
                }
            }
        }
    }
}

