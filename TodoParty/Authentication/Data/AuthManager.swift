//
//  AuthManager.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import FirebaseAuth
import SwiftUI

final class AuthManager: ObservableObject {
  var user: User? {
    didSet {
      objectWillChange.send()
    }
  }
  
  func listenToAuthState() {
    Auth.auth().addStateDidChangeListener { [weak self] _, user in
      guard let self = self else {
        return
      }
      self.user = user
    }
  }
  
  func signUp(withEmail email: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
      if let error {
        print("❌ -> Failed to Register. Error: \(error)")
      }
    }
  }
  
  func signIn(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
      if let error {
        print("❌ -> Failed to Log in. Error: \(error)")
      }
    }
  }
  
  func signOut() {
    try? Auth.auth().signOut()
  }
}
