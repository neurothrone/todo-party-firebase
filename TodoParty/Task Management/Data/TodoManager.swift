//
//  TodoManager.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import FirebaseAuth
import FirebaseDatabase
import SwiftUI

final class TodoManager: ObservableObject {
  @Published var todos: [TodoModel] = []
  @Published var newTodoName = ""
  
  private lazy var databasePath: DatabaseReference? = {
    guard let uid = Auth.auth().currentUser?.uid else {
      return nil
    }
    
    let ref = Database.database()
      .reference()
      .child("users/\(uid)/todos")
    return ref
  }()
  
  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()
  
  func listenForTodos() {
    guard let databasePath = databasePath else {
      return
    }
    
    databasePath.observe(.childAdded) { [weak self] snapshot in
      guard let self = self,
            var json = snapshot.value as? [String: Any]
      else {
        return
      }
      
      json["id"] = snapshot.key
      
      do {
        let todoData =  try JSONSerialization.data(withJSONObject: json)
        let todo = try self.decoder.decode(TodoModel.self, from: todoData)
        self.todos.append(todo)
      } catch {
        print("❌ -> Failed to observe todos. Error: \(error)")
      }
    }
  }
  
  func stopListening() {
    databasePath?.removeAllObservers()
  }
  
  func addTodo() {
    guard let databasePath = databasePath,
          !newTodoName.isEmpty
    else {
      return
    }
    
    let newTodo = TodoModel(name: newTodoName)
    
    do {
      let data = try encoder.encode(newTodo)
      let json = try JSONSerialization.jsonObject(with: data)
      databasePath.childByAutoId()
        .setValue(json)
    } catch {
      print("❌ -> Failed to add Todo. Error: \(error)")
    }    
  }
}
