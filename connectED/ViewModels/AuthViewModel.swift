//
//  AuthViewModel.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/29/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var user: User?
    private let db = Firestore.firestore()
    
    var isLoggedIn: Bool {
        return user != nil
    }
    
    func register(email: String, password: String, firstName: String, lastName: String, displayName: String, university: String, major: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self, let firebaseUser = result?.user else {
                print("ERROR CREATING USER")
                return
            }
            
            /* create new user model */
            let newUser = User(
                id: firebaseUser.uid,
                email: email,
                firstName: firstName,
                lastName: lastName,
                displayName: displayName,
                university: university,
                major: major
            )
            
            /* insert new user model into users collection */
            do {
                try db.collection("users").document(firebaseUser.uid).setData(from: newUser)
                DispatchQueue.main.async {
                    self.user = newUser
                }
            } catch {
                print("ERROR SAVING NEW USER TO USERS COLLECTION")
            }
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self, let firebaseUser = result?.user else {
                print("ERROR LOGGING IN USER")
                return
            }
            
            /* fetch user from users collection */
            db.collection("users").document(firebaseUser.uid).getDocument { snapshot, error in
                if let error = error {
                    print("ERROR RETRIEVING USER FROM USERS COLLECTION: \(error.localizedDescription)")
                    return
                }

                if let snapshot = snapshot, snapshot.exists {
                    do {
                        let fetchedUser = try snapshot.data(as: User.self)
                        DispatchQueue.main.async {
                            self.user = fetchedUser
                        }
                    } catch {
                        print("ERROR DECODING USER DATA: \(error.localizedDescription)")
                    }
                } else {
                    print("USER DOCUMENT DOES NOT EXIST IN FIRESTORE")
                }
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.user = nil
            }
        } catch let signOutError {
            print("Error signing out: \(signOutError)")
        }
    }
}
