//
//  WelcomeScreenViewController.swift
//  Adjacent Finances
//
//  Created by Nick Wichert on 12/20/18.
//  Copyright © 2018 Nick Wichert. All rights reserved.
//

import UIKit
import Firebase

class WelcomeScreenViewController: UIViewController {
    
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    var isSignIn: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        isSignIn = !isSignIn // Flip boolean
        
        // Check boolean and set the button and labels
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        let ref = Database.database().reference().root
        
        // TODO: Do some form validation on username and password
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
            // Check if it is sign in or register
            if isSignIn {
                // Sign in user with Firebase
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    // Check that user isn't nil
                    if let u = Auth.auth().currentUser {
                        // segue user to ranks dashboard
                        self.performSegue(withIdentifier: "goToRankingsDashboard", sender: self)
                    }
                    else {
                        // error, check error and show message
                        
                    }
                }
            }
            else {
                // Register user with Firebase
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    // check that user isn't nil
                    if let u = user {
                        ref.child("users").child((user?.user.uid)!).setValue(email)
                        // segue user to ranks dashboard
                        self.performSegue(withIdentifier: "updateDataUponRegistering", sender: self)
                    }
                    else {
                        // error, check error and show message
                        if error != nil {
                            print(error!)
                        }
                    }
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Dismiss the keyboard when the view is tapped on
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
}
