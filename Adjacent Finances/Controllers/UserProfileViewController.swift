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
    
    
    var dbRef: DatabaseReference?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = Database.database().reference()
        
    }
    
    
    
    @IBAction func updateTapped(_ sender: Any) {
    }
    

}
