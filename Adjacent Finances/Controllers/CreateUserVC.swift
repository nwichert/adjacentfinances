//
//  CreateUserVC.swift
//  Adjacent Finances
//
//  Created by Nick Wichert on 12/26/18.
//  Copyright © 2018 Nick Wichert. All rights reserved.
//

import UIKit
import Firebase

class CreateUserVC: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var birthYearTxt: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func createTapped(_ sender: Any) {
        
        guard let email = emailTxt.text,
            let password = passwordTxt.text,
            let birthYear = birthYearTxt.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                debugPrint("Error creating user: \(error.localizedDescription)")
            }
            
            guard let userId = user?.user.uid else {return}
            Firestore.firestore().collection("users").document(userId).setData([
                "birthYear" : birthYear,
                "timestamp" : FieldValue.serverTimestamp()
                ], completion: { (error) in
                
                    if let error = error {
                        debugPrint(error.localizedDescription)
                    } else {
                        self.dismiss(animated: true, completion: nil)
                    }
            })
        }
    }
    


}
