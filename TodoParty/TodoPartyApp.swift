//
//  TodoPartyApp.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import Firebase
import SwiftUI

@main
struct TodoPartyApp: App {
  init() {
    FirebaseApp.configure()
    Database.database().isPersistenceEnabled = true
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(AuthManager())
    }
  }
}
