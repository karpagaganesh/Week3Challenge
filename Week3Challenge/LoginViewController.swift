//
//  ViewController.swift
//  Week3Challenge
//
//  Created by Patchirajan, Karpaga Ganesh on 4/12/17.
//  Copyright © 2017 Patchirajan, Karpaga Ganesh. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginUser(_ sender: Any) {
//        PFUser.logInWithUsername(inBackground: emailTextField.text!, password:passwordTextField.text!) {
        PFUser.logInWithUsername(inBackground: "myUsernameBreakroom4", password:"myPasswordBreakroom4") {
            (user, error) -> Void in
            if user != nil {
                // Do stuff after successful login.
                self.performSegue(withIdentifier: "LoginSeque", sender: nil)
            } else {
                // The login failed. Check error to see why.
            }
        }
    }
    
    @IBAction func signUpUser(_ sender: Any) {
        var user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
        user.email = "email4@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackground {
            (succeeded, error) -> Void in
            if let error = error {
                let errorString = error.localizedDescription as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
        
    }

    func myMethod() {
        var user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackground {
            (succeeded, error) -> Void in
            if let error = error {
                let errorString = error.localizedDescription as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
        
        PFUser.logInWithUsername(inBackground: "myUsername", password:"myPassword") {
            (user, error) -> Void in
            if user != nil {
                // Do stuff after successful login.
                self.performSegue(withIdentifier: "LoginSeque", sender: nil)
            } else {
                // The login failed. Check error to see why.
            }
        }
    }
    
}

