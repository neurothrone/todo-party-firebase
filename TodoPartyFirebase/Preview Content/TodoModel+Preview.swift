//
//  TodoModel+Preview.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import Foundation

extension TodoItem {
  enum Preview {
    static var sample: TodoItem {
      .init(id: UUID().uuidString, name: "Take a walk")
    }
    
    static var samples: [TodoItem] {
      [
        .init(id: UUID().uuidString, name: "Take a walk"),
        .init(id: UUID().uuidString, name: "Buy groceries"),
        .init(id: UUID().uuidString, name: "Vacuum house"),
        .init(id: UUID().uuidString, name: "Clean dishes")
      ]
    }
  }
}
