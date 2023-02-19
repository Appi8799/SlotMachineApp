//
//  FirebaseManager.swift
//  A3_MAPD724_Group5
//
//  Created by Apeksha Parmar on 2023-02-17.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore

class FirebaseManager
{
    var db: Firestore!
    var Global_Jackpot: String
    var Highest_Pay: String
    
    init()
    {
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        
        Global_Jackpot = "1000"
        Highest_Pay = "100"
        
        //var ref = db.database().reference().child("Global_Jackpot").setValue("1000")
        
        let gdRef = db.collection("Global_Jackpot")
        gdRef.document("Global_Jackpot").setData(["Global_Jackpot": 1000])
        gdRef.document("Highest_Pay").setData(["Highest_Pay": 90])
    }
    
    public func saveData()
    {
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "MAPD724",
            "last": "iOS",
            "born": 1999
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    public func updateGlobalData(key: String, value: Int)
    {
        let gdRef = db.collection("global_data")
        
        gdRef.document(key).setData([
            key: value
        ])
    }
    
    public func getGlobalData(key:String)
    {
        let docRef = db.collection("global_data").document(key)
        
        docRef.getDocument { (document, error) in
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.Global_Jackpot = data["global_jackpot"] as? String ?? ""
                    print("gg", self.Global_Jackpot)
                }
            }
        }
    }
}
