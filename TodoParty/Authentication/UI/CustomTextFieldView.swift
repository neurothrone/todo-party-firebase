//
//  CustomTextFieldView.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import SwiftUI

struct CustomTextFieldView: View {
  @Environment(\.colorScheme) private var colorScheme
  
  @Binding var text: String
  
  let label: String
  let isSecure: Bool
  
  init(
    text: Binding<String>,
    label: String,
    isSecure: Bool = false
  ) {
    _text = text
    self.label = label
    self.isSecure = isSecure
  }
  
  var body: some View {
    Group {
      if isSecure {
        SecureField(label, text: $text)
          .textContentType(.password)
      } else {
        TextField(label, text: $text)
          .textContentType(.emailAddress)
          .keyboardType(.emailAddress)
      }
    }
    .foregroundColor(colorScheme == .dark ? .white : .black)
    .autocorrectionDisabled(true)
    .textInputAutocapitalization(.never)
    .padding()
    .background(.regularMaterial)
    .background(Color.mint.opacity(0.25))
    .clipShape(Capsule())
  }
}

struct CustomTextFieldView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      LinearGradient(
        colors: [.mint, .purple],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()
      
      CustomTextFieldView(text: .constant(""), label: "Email")
    }
//    .preferredColorScheme(.dark)
  }
}
