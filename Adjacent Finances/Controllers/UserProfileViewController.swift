//
//  UserProfileViewController.swift
//  Adjacent Finances
//
//  Created by Nick Wichert on 12/20/18.
//  Copyright © 2018 Nick Wichert. All rights reserved.
//

import UIKit
import Firebase

class UserProfileViewController: UIViewController {
    
    
    @IBOutlet weak var birthYearTextField: UITextField!
    @IBOutlet weak var savingsAmountTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func updateTapped(_ sender: Any) {
        Firestore.firestore().collection("users").addDocument(data: [
            "savingsAmount" : savingsAmountTextField.text!,
            "birthYear" : birthYearTextField.text!,
            "timeStamp" : FieldValue.serverTimestamp()
        ]) { (err) in
            if let err = err {
                debugPrint("Error adding document: \(err)")
            } else {
                self.performSegue(withIdentifier: "updateDataUponReturning", sender: self)
            }
        }
    }
    

}
