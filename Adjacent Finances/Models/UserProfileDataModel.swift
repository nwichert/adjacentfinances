//
//  UserProfileDataModel.swift
//  Adjacent Finances
//
//  Created by Nick Wichert on 12/21/18.
//  Copyright © 2018 Nick Wichert. All rights reserved.
//

import Foundation
import Firebase

class ProfileData {
    
    private(set) var savingsAmount: Int!
    private(set) var birthYear: Int!
    private(set) var timestamp: Timestamp!
    private(set) var documentId: String!
    
    init(savingsAmount: Int, birthYear: Int, timestamp: Timestamp, documentId: String) {
        self.savingsAmount = savingsAmount
        self.birthYear = birthYear
        self.timestamp = timestamp
        self.documentId = documentId
    }
    
}
