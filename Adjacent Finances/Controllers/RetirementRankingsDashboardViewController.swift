//
//  RetirementRankingsDashboardViewController.swift
//  Adjacent Finances
//
//  Created by Nick Wichert on 12/20/18.
//  Copyright © 2018 Nick Wichert. All rights reserved.
//

import UIKit
import Firebase

class RetirementRankingsDashboardViewController: UIViewController {
    
    // Variables
    private var user = [ProfileData]()
    private var profileDataRef: CollectionReference!
    private var handle: AuthStateDidChangeListenerHandle?
    private var rankingStatus = [
        "good",
        "average",
        "below"]
    private var rankingOverview = [
        "you are saving more for retirement than most people your age, great job!",
        "you are saving about the same for retirement as most people your age.",
        "you are saving less for retirement than other people your age."
    ]
    
    // Outlets
    @IBOutlet weak var rankingOverviewLabel: UILabel!
    @IBOutlet weak var rankingStatusLabel: UILabel!
    @IBOutlet weak var minimumAmountLabel: UILabel!
    @IBOutlet weak var maximumAmountLabel: UILabel!
    @IBOutlet weak var twentyfifthAmountLabel: UILabel!
    @IBOutlet weak var fiftyithAmountLabel: UILabel!
    @IBOutlet weak var seventyFifthAmountLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileDataRef = Firestore.firestore().collection("profileData")
        
        // TODO: Call each calculation function to run when screen loads
//        minimumCalc()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(withIdentifier: "loginVC")
                self.present(loginVC, animated: true, completion: nil)
            } else {
                return
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        return
    }
    
    //    TODO: func setListener()
    
    
//    func minimumCalc() {
//        Firestore.firestore().collection("profileData").getDocuments { (snapshot, err) in
//            if let err = err {
//                print("Error getting documents")
//            } else {
//                for document in snapshot!.documents {
                    // let docId = document.documentID
//                    let savingsAmount = document.get("savingsAmount") as! String
                    // TODO: Get the minimum number within the array
                    // let minimumAmount = savingsAmount.min()
                    // print(minimumAmount!)
                    // TRY appending to minimumAmountArray and running calc after that
//
//                }
//            }
//        }
//    }
    

    
//    @IBAction func editProfileBtnTapped(_ sender: UIButton) {
//        performSegue(withIdentifier: "editUpdateUserProfileSegue", sender: self)
//    }
    
    
//    @IBAction func refreshDataBtnTapped(_ sender: UIButton) {
//    }
    
}
