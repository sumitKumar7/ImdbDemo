//
//  FirebaseAuthHandler.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthHandler {
    static let shared = FirebaseAuthHandler()
    private init() { }
    
    func createUser(with email: String, password: String, completion: @escaping(User?, Error?) -> Void?) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let user = authDataResult?.user {
                completion(user, nil)
            }
            if let _error = error {
                completion(nil, _error)
            }
        }
    }
    
    func signInUser(with email: String, password: String, completion: @escaping(User?, Error?) -> Void?) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                completion(user, nil)
            }
            if let _error = error {
                completion(nil, _error)
            }
        }
    }
}
