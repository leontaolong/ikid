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
    var head = true
    
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
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if (head) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstView.view.frame = view.frame
            lbJoke.text = "Yoda: Off course, we are."
            btnFlip.setTitle("Back", for: UIControlState.normal)
            UIView.commitAnimations()
            head = false
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            firstView.view.frame = view.frame
            lbJoke.text = "Luke Skywalker: Yoda, are we going in the right direction?"
            btnFlip.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            head = true
        }
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

