//
//  ParseSignUpAppearance.swift
//  NorthernLights
//
//  Created by Timothy Richardson on 31/12/2015.
//  Copyright © 2015 Timothy Richardson. All rights reserved.
//

import UIKit


class ParseSignUpAppearance: PFSignUpViewController {

    
    var backgroundImage : UIImageView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set our custom background image
        backgroundImage = UIImageView(image: UIImage(named: "Melbourne"))
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        
        signUpView!.insertSubview(backgroundImage, atIndex: 0)
        
/*
        // apply the blur effect
        backgroundImage.image = UIImage(named: "Melbourne")
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        view.addSubview(blurEffectView)
        view.insertSubview(blurEffectView, atIndex: 1)
*/
        
        // Remove the Parse Logo
        let logo = UILabel()
        logo.text = "North Lights"
        logo.textColor = UIColor.whiteColor()
        logo.font = UIFont(name: "Pacifico", size: 70)
        logo.shadowColor = UIColor.lightGrayColor()
        logo.shadowOffset = CGSizeMake(2, 2)
        signUpView?.logo = logo
        
        // Make the background of the sign up button pop more
        signUpView?.signUpButton!.setBackgroundImage(nil, forState: .Normal)
        signUpView?.signUpButton!.backgroundColor = UIColor(red: 52/255, green: 191/255, blue: 73/255, alpha: 1)
        
        // Change dismiss button to say 'Already signed up?'
        signUpView?.dismissButton!.setTitle("Already signed up?", forState: .Normal)
        signUpView?.dismissButton!.setTitle(nil, forState: .Normal)
        
        // Modify the present transition to be a flip instead
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Stretch backgorund image to fill screen
        backgroundImage.frame = CGRectMake(0, 0, signUpView!.frame.width, signUpView!.frame.height)
        
        // Position logo at top with larger frame
        signUpView!.logo!.sizeToFit()
        let logoFrame = signUpView!.logo!.frame
        signUpView!.logo!.frame = CGRectMake(logoFrame.origin.x, signUpView!.usernameField!.frame.origin.y - logoFrame.height - 16, signUpView!.frame.width,  logoFrame.height)
        
        // Re-layout out dismiss button to be below sign
        let dismissButtonFrame = signUpView!.dismissButton!.frame
        signUpView?.dismissButton!.frame = CGRectMake(0, signUpView!.signUpButton!.frame.origin.y + signUpView!.signUpButton!.frame.height + 16.0, signUpView!.frame.width, dismissButtonFrame.height)
    }
    
}