//
//  ThirdViewController.swift
//  iKid
//
//  Created by Leon T Long on 2/4/18.
//  Copyright © 2018 longt8. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    fileprivate var thirdView : ThirdViewController!
    @IBOutlet weak var lbJoke: UILabel!
    @IBOutlet weak var btnFlip: UIButton!
    var fliped = false
    
    fileprivate func thirdBuilder() {
        if thirdView == nil {
            thirdView =
                storyboard?
                    .instantiateViewController(withIdentifier: "dadView")
                as! ThirdViewController
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        thirdBuilder()
        
        fliped = !fliped
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
        thirdView.view.frame = view.frame
        
        if (fliped) {
            lbJoke.text = "No, I don’t think they’ll fit me."
            btnFlip.setTitle("Back", for: UIControlState.normal)
        } else {
            lbJoke.text = "Dad, can you put my shoes on?"
            btnFlip.setTitle("Next", for: UIControlState.normal)
        }
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
