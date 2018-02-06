//
//  FirstViewController.swift
//  iKid
//
//  Created by Leon T Long on 2/4/18.
//  Copyright © 2018 longt8. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    fileprivate var firstView : FirstViewController!
    @IBOutlet weak var lbJoke: UILabel!
    @IBOutlet weak var btnFlip: UIButton!
    var fliped = false
    
    
    fileprivate func firstBuilder() {
        if firstView == nil {
            firstView =
                storyboard?
                    .instantiateViewController(withIdentifier: "goodView")
                as! FirstViewController
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        firstBuilder()
        
        fliped = !fliped
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
        firstView.view.frame = view.frame
        
        if (fliped) {
            lbJoke.text = "would you be a vacuum cleaner?"
            btnFlip.setTitle("Back", for: UIControlState.normal)
        } else {
            lbJoke.text = "If you were to clean a vacuum,"
            btnFlip.setTitle("Next", for: UIControlState.normal)
        }
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

