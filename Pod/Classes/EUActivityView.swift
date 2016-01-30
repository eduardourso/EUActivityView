//
//  EUActivityView.swift
//  Pods
//
//  Created by EduardoUrso on 1/27/16.
//
//

import UIKit

public enum EUActivityIndicatorStyle {
    
    /**
     Pulse.
     - returns: Instance of EUActivityIndicatorAnimationPulse.
     */
    case Pulse
    
    /**
     SoundScale.
     - returns: Instance of EUActivityIndicatorAnimationSoundScale.
     */
    case SoundScale
    
    private func animation() -> EUActivityViewAnimationDelegate {
        switch self {

        case .Pulse:
            return EUActivityIndicatorAnimationPulse()

        case .SoundScale:
            return EUActivityIndicatorAnimationSoundScale()
        }
        

    }
}

public class EUActivityView: UIView {
    
    lazy var activityIndicator:UIActivityIndicatorView = {

        var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
        activityIndicator.layer.backgroundColor = self.customBackgroundColor.CGColor
        activityIndicator.frame = self.customBackgroundFrame
        activityIndicator.layer.cornerRadius = 5.0
        activityIndicator.startAnimating()
        return activityIndicator
        
    } ()
    
    lazy var backgroundView:UIView = {
        
        var backgroundView = UIView(frame: self.customBackgroundFrame)
        backgroundView.layer.backgroundColor = self.customBackgroundColor.CGColor
        backgroundView.layer.cornerRadius = 5.0
        
        return backgroundView
    
    }()
    
    private var superView:UIView?
    private var customSize = CGSize(width: 50, height: 50)
    private var customBackgroundFrame:CGRect = CGRectMake(0, 0, 100, 100)
    
    public var type: EUActivityIndicatorStyle
    public var customBackgroundColor: UIColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.7)
    public var customActivityIndicatorColor: UIColor = UIColor.whiteColor()
    
    public override init(frame: CGRect) {
        self.type = EUActivityIndicatorStyle.Pulse
        self.customSize = CGSize(width: frame.width/2, height: frame.height/2)
        self.customBackgroundFrame = frame
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func showDefaultActivityView(superView:UIView) {
        
        // TODO: check what can be removed from the main queue
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.superView = superView
            if let center = self.superView?.center {
                self.center = center
                self.activityIndicator.center = center
            }
            
            superView.addSubview(self.activityIndicator)
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        }
    }
    
    public func showCustomActivityView(superView:UIView, type:EUActivityIndicatorStyle) {
        
        // TODO: check what can be removed from the main queue
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.superView = superView
            if let center = self.superView?.center {
                self.center = center
                self.backgroundView.center = center
            }
            
            self.type = type
            
            let animation: protocol<EUActivityViewAnimationDelegate> = self.type.animation()
            self.layer.sublayers = nil
            animation.setUpAnimationInLayer(self.backgroundView.layer, size: self.customSize, color: self.customActivityIndicatorColor)
            
            self.backgroundView.addSubview(self)
            
            superView.addSubview(self.backgroundView)
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        }
    }
    
    public func hideLoadingView() {
    
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.activityIndicator.stopAnimating()
            self.backgroundView.removeFromSuperview()
            
            if UIApplication.sharedApplication().isIgnoringInteractionEvents() {
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
            }
        }
    }
}
