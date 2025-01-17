//
//  ContentView.swift
//  Donezo
//
//  Created by Abel Gomez on 1/14/25.
//

/*
 Clone = Copying the repo locally
 Commit = Save ("checkpoint") on current branch
 Stage = Prepare changes for a commit
 Stash = Save changes for later
 Push = Send local commits to remote repo
 Pull = Fetch remote commits to local repo
 
 COMMIT MESSAGES
 
 NEW FEATURE:
 [Feature] Description of the feature
 
 BUG NOT IN PRODUCTION:
 [Patch] Description of patch
 
 RELEASE:
 [Release] Description of release
 
 BUG IN PRODUCTION:
 [Patch] Description of patch
 
 MUNDANE TASKS:
 [Clean] Description of changes
 */

import SwiftUI

struct ContentView: View {
  @State private var todoList: [String] = []
  @State private var isSheetShowing = false
  
  
  var body: some View {
    NavigationStack {
      VStack {
        List(todoList, id: \.self) { item in
          Text("\(item)")
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .principal) {
            Text("List").font(.title)
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              isSheetShowing = true
            } label: {
              Image(systemName: "plus")
            }
          }
        }
      }
      .sheet(isPresented: $isSheetShowing) {
        AddTaskView(todoList: $todoList)
          .presentationDetents([.medium, .large])
          .presentationDragIndicator(.visible)
      }
    }
  }
}

struct AddTaskView: View {
  @State private var newTask = ""
  @Binding var todoList: [String]
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    NavigationStack {
      Form {
        TextField("New item", text: $newTask)
        Button("Add Task") {
          if !newTask.isEmpty {
            todoList.append(newTask)
            dismiss()
          }
        }
      }
      .navigationTitle("Add Task")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  ContentView()
}

#Preview {
  AddTaskView(todoList: .constant(["Item"]))
}
