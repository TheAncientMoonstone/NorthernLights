//
//  ParseLogInViewController.swift
//  NorthernLights
//
//  Created by Timothy Richardson on 31/12/2015.
//  Copyright © 2015 Timothy Richardson. All rights reserved.
//

import UIKit


class ParseLogInViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (PFUser.currentUser() == nil) {
            let loginViewController = ParseLogInAppearance()
            loginViewController.delegate = self
            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook, .Twitter]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController?.delegate = self
            self.presentViewController(loginViewController, animated: false, completion: nil)
        } else {
            //presentLoggedInAlert()
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainViewController")
            self.presentViewController(vc, animated: true, completion: nil)
        }
        //presentLoggedInAlert()
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainViewController")
            self.presentViewController(vc, animated: true, completion: nil)
        }
        //presentLoggedInAlert()
    }
    
    func presentLoggedInAlert() {
        let alertController = UIAlertController(title: "You're now logged in", message: "Welcome to Northern Lights", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
