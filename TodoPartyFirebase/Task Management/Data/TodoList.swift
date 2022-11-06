//
//  TodoList.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-11-03.
//

import Foundation

struct TodoList: Identifiable {
  var id: String?
  var name: String
  
  var items: [TodoItem] = []
}

extension TodoList: Codable {}
