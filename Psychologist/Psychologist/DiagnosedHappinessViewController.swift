//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Victor Hazali on 28/10/15.
//  Copyright © 2015 Victor Hazali. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController : HappinessViewController, UIPopoverPresentationControllerDelegate {
    
    override var happiness: Int {
        didSet{
            diagnosticHistory += [happiness]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    var diagnosticHistory: [Int] {
        get{return defaults.objectForKey(History.DefaultKey) as? [Int] ?? []}
        set{ defaults.setObject(newValue, forKey: History.DefaultKey)}
    }
    
    private struct History {
        static let SegueIdentifier = "showDiagnosticHistory"
        static let DefaultKey = "DiagnosedHappinessViewController.DiagnosticHistory"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? HistoryViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                        
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
