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
  var todoList = [""]
  
  
  var body: some View {
    NavigationStack {
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
            print("Adding")
          } label: {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
