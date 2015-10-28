//
//  HistoryViewController.swift
//  Psychologist
//
//  Created by Victor Hazali on 28/10/15.
//  Copyright © 2015 Victor Hazali. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!{
        didSet{
            textView.text=text
        }
    }
    
    var text = ""{
        didSet{
            textView?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get{
            // Checks if it is currently presenting
            if textView != nil && presentingViewController != nil {
               return (textView.sizeThatFits(presentingViewController!.view.bounds.size))
            }
            return super.preferredContentSize
        }
        set{ super.preferredContentSize = newValue }
    }
}
