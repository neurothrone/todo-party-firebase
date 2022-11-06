//
//  TodoListScreen.swift
//  TodoParty
//
//  Created by Zaid Neurothrone on 2022-10-24.
//

import SwiftUI

struct TodoListScreen: View {
  @EnvironmentObject var authManager: AuthManager
  
  @State private var isShowingAddTodoView = false
  @StateObject private var todoManager: TodoManager
  
  init(todoManager: TodoManager = .init()) {
    _todoManager = StateObject(wrappedValue: todoManager)
  }
  
  var body: some View {
    NavigationStack {
      content
        .navigationTitle("Todos")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: todoManager.listenForTodos)
        .onDisappear(perform: todoManager.stopListening)
        .toolbar {
          ToolbarItem(placement: .bottomBar) {
            Button(action: authManager.signOut) {
              Text("Sign Out")
            }
          }
          
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: { isShowingAddTodoView.toggle() }) {
              Image(systemName: "plus.circle.fill")
                .font(.title)
                .foregroundColor(
                  isShowingAddTodoView
                  ? .purple
                  : .secondary
                )
            }
          }
        }
    }
  }
  
  private var content: some View {
    ZStack(alignment: .top) {
      Color(UIColor.secondarySystemBackground)
        .ignoresSafeArea()
      
      VStack {
        Group {
          HStack {
            TextField("New Todo name", text: $todoManager.newTodoName)
            
            Button(action: todoManager.addTodo) {
              Label("Add Todo", systemImage: "plus.square.fill")
            }
            .disabled(todoManager.newTodoName.isEmpty)
          }
          .frame(maxWidth: .infinity)
          .padding()
          .background(.purple.opacity(0.25))
          .background(.ultraThinMaterial)
          .offset(y: isShowingAddTodoView
                  ? 0
                  : -200
          )
          
          List {
            ForEach(todoManager.todos) { todo in
              Text(todo.name)
            }
          }
          .scrollContentBackground(.hidden)
          .offset(y: isShowingAddTodoView
                  ? 0
                  : -75
          )
        }
        .animation(.linear, value: isShowingAddTodoView)
      }
    }
  }
}

struct TodoListScreen_Previews: PreviewProvider {
  static var previews: some View {
    let todoManager = TodoManager()
    todoManager.todos = TodoItem.Preview.samples
    
    return TodoListScreen(todoManager: todoManager)
      .environmentObject(AuthManager())
  }
}
