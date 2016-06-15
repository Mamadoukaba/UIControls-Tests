//
//  ViewController.swift
//  KnowledgeTest
//
//  Created by Mamadou Kaba on 6/12/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    var mySwitch: UISwitch!
    var segmentedControl: UISegmentedControl!
    var itemsWithImages = NSArray(objects: "Google", UIImage(named: "AppleIcon")!, "Facebook")
    
    //MARK: IBOutlets
    
    @IBOutlet weak var segmentedControlLabel: UILabel!
    
    //MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Blur Effect
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurview = UIVisualEffectView(effect: blurEffect)
        
        blurview.frame.size = CGSize(width: 300, height: 500)
        blurview.center = view.center
        
        view.addSubview(blurview)
        
        //MARK: Switch
        mySwitch = UISwitch(frame: CGRect(x: 200, y: 200, width: 0, height: 0))
        view.addSubview(mySwitch)
        
        turnSwitchOn()
        
        mySwitch.addTarget(self, action: "mySwitchChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        changeSwitchColor()
        
        //MARK: SegmentedControl
        segmentedControl = UISegmentedControl(items: itemsWithImages as [AnyObject])
        segmentedControl.center = CGPoint(x: view.center.x, y: view.center.y + 200)
        segmentedControl.tintColor = UIColor.blackColor()
        view.addSubview(segmentedControl)
        
        segmentedControl.addTarget(self, action: "segmentedControlChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //MARK: Functions
        //MARK: Switch
            func turnSwitchOn() {
                mySwitch.setOn(true, animated: true)
            }
    
            func changeSwitchColor() {
                mySwitch.tintColor = UIColor.darkGrayColor()
                mySwitch.onTintColor = UIColor.yellowColor()
                mySwitch.thumbTintColor = UIColor.grayColor()
            }
    
        //MARK: Segmented Control
            func segmentedControlChanged(sender: UISegmentedControl) {
                let selectedIndex = sender.selectedSegmentIndex
                print(selectedIndex)
                
                if let selectedSegment = sender.titleForSegmentAtIndex(selectedIndex) {
                    print(selectedSegment)
                }
            }
    
    
    //MARK: Actions
    
    func mySwitchChanged(sender: UISwitch) {
        if mySwitch.on {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
    }
}

