//
//  RetirementRankingsDashboardViewController.swift
//  Adjacent Finances
//
//  Created by Nick Wichert on 12/20/18.
//  Copyright © 2018 Nick Wichert. All rights reserved.
//

import UIKit

class RetirementRankingsDashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func editProfileBtnTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "editUpdateUserProfileSegue", sender: self)
    }
    
    
    @IBAction func refreshDataBtnTapped(_ sender: UIButton) {
    }
    
}
