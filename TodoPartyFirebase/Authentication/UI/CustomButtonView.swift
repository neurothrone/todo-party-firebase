//
//  CustomButtonView.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import SwiftUI

struct CustomButtonView: View {
  let label: String
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      Text(label)
        .bold()
        .foregroundColor(.primary)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .background(.purple)
        .clipShape(Capsule())
        .padding(.horizontal)
    }
  }
}

struct CustomButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      LinearGradient(
        colors: [.mint, .purple],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()
      
      CustomButtonView(label: "Sign In", action: {})
    }
  }
}
