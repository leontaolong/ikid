//
//  SecondViewController.swift
//  iKid
//
//  Created by Leon T Long on 2/4/18.
//  Copyright © 2018 longt8. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    fileprivate var secondView : SecondViewController!
    @IBOutlet weak var lbJoke: UILabel!
    @IBOutlet weak var btnFlip: UIButton!
    var fliped = false
    
    fileprivate func secondBuilder() {
        if secondView == nil {
            secondView =
                storyboard?
                    .instantiateViewController(withIdentifier: "punView")
                as! SecondViewController
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        secondBuilder()
        
        fliped = !fliped
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
        secondView.view.frame = view.frame
        
        if (fliped) {
            lbJoke.text = "but then I changed my mind."
            btnFlip.setTitle("Back", for: UIControlState.normal)
        } else {
            lbJoke.text = "I wasn't originally going to get a brain transplant,"
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

