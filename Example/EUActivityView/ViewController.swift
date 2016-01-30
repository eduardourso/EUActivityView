//
//  ViewController.swift
//  EUActivityView
//
//  Created by Eduardo Urso on 01/27/2016.
//  Copyright (c) 2016 Eduardo Urso. All rights reserved.
//

import EUActivityView

class ViewController: UIViewController {

    var activityView = EUActivityView(frame: CGRectMake(0,0,100,100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Usage:
        
        //Color customization
//        self.activityView.customBackgroundColor = UIColor.yellowColor()
//        self.activityView.customActivityIndicatorColor = UIColor.greenColor()

        //Custom styles
//        activityView.showDefaultActivityView(self.view)
//        self.activityView.showCustomActivityView(self.view, type: .SoundScale)
        self.activityView.showCustomActivityView(self.view, type: .Pulse)

        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.activityView.hideLoadingView()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

