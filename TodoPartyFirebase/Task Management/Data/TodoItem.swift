//
//  TodoItem.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import Foundation

struct TodoItem: Identifiable {
  var id: String?
  var name: String
}

extension TodoItem: Codable {}
