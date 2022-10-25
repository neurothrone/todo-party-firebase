//
//  ContentView.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var authManager: AuthManager
  
  var body: some View {
    Group {
      if authManager.user != nil {
        TodoListScreen()
      } else {
        AuthScreen()
      }
    }
    .onAppear(perform: authManager.listenToAuthState)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(AuthManager())
  }
}
