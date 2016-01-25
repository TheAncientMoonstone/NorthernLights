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
            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController?.delegate = self
            self.presentViewController(loginViewController, animated: false, completion: nil)
        } else {
            
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainViewController")
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainViewController")
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
    }
    
    func signUpViewController() {
        // This allows for users to signup without to have a Facebook account.
        let user = PFUser()
        
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        user["phone"] = "04111-62558"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error{
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try that again.
            } else {
                // Hooray! Let them use the app now!
            }
        }
        
    }
    
    func logInViewController() {
        PFUser.logInWithUsernameInBackground("myname", password: "mypass") {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
            } else {
                // The login failed. Check error to see why.
        }
            let currentUser = PFUser.currentUser()
            if currentUser != nil {
                // Do stuff with the user
            } else {
                // Show the signup or login screen.
            }
        }
    }
}