//
//  AuthScreen.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import SwiftUI

struct AuthScreen: View {
  @EnvironmentObject var authManager: AuthManager
  
  @State private var email = ""
  @State private var password = ""
  
  @State private var isAlertPresented = false
  
  private var isInputValid: Bool {
    !email.isEmpty && !password.isEmpty
  }
  
  var body: some View {
    ZStack(alignment: .top) {
      LinearGradient(
        colors: [.mint, .purple],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()
      
      VStack(alignment: .center, spacing: 40) {
        VStack(spacing: 0) {
          Image("logo")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 200, maxHeight: 200)
          
          Text("TodoParty")
            .foregroundColor(Color(0x5A189A))
            .font(.largeTitle)
            .bold()
        }
        
        VStack(alignment: .center, spacing: 16) {
          CustomTextFieldView(text: $email, label: "Email")
          CustomTextFieldView(text: $password, label: "Password", isSecure: true)
        }
        .padding(.horizontal)
        
        CustomButtonView(label: "Sign Up", action: signUp)
        Text("OR")
          .font(.title2.bold())
          .foregroundColor(.black)
        CustomButtonView(label: "Sign In", action: signIn)
      }
    }
  }
}

extension AuthScreen {
  private func validateInput() {
    if !isInputValid {
      isAlertPresented.toggle()
    }
  }
  
  private func signUp() {
    validateInput()
    authManager.signUp(withEmail: email, password: password)
  }
  
  private func signIn() {
    validateInput()
    
    authManager.signIn(withEmail: email, password: password)
  }
}

struct AuthScreen_Previews: PreviewProvider {
  static var previews: some View {
    AuthScreen()
      .environmentObject(AuthManager())
//      .preferredColorScheme(.dark)
  }
}
