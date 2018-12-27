//
//  UserProfileViewController.swift
//  Adjacent Finances
//
//  Created by Nick Wichert on 12/20/18.
//  Copyright © 2018 Nick Wichert. All rights reserved.
//

import UIKit
import Firebase

class AddUserProfileViewController: UIViewController {
    
    
    @IBOutlet weak var birthYearTextField: UITextField!
    @IBOutlet weak var savingsAmountTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func updateTapped(_ sender: Any) {
        Firestore.firestore().collection("profileData").addDocument(data: [
            "savingsAmount" : savingsAmountTextField.text!,
            "timeStamp" : FieldValue.serverTimestamp()
        ]) { (err) in
            if let err = err {
                debugPrint("Error adding document: \(err)")
            } else {
                self.performSegue(withIdentifier: "RetirementRankingsDashboardViewController", sender: self)
            }
        }
    }
    

}
