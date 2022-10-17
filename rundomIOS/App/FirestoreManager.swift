//
//  FirestoreManager.swift
//  rundomIOS
//
//  Created by Thomas Bird on 10/16/22.
//

import Foundation
import Firebase


class FirestoreManager: ObservableObject {
    @Published var message: String = ""
    //MOTD fetcher
    
    init() {
        fetchMessage()
    }
    
    func fetchMessage() {
        let db = Firestore.firestore()

        let docRef = db.collection("serverMessages").document("messageOTD")

        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.message = data["message"] as? String ?? ""
                }
            }

        }
    }
    
}

