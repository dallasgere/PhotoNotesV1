//
//  AddNewPhotoNote.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/22/24.
//

import SwiftUI

struct AddNewPhotoNote: View {
    // passing in the view model and title to add back in
    @ObservedObject var homeViewModel: HomeViewModel
    @Binding var newPhotoNoteTitle: String
    
    // this allows to close the sheet after the button has been pressed
    @Environment(\.presentationMode) var presentationMode
    
    // view
    var body: some View {
        NavigationStack {
            Form {
                TextField("New Todo", text: $newPhotoNoteTitle)
                
                Button(action: {
                    homeViewModel.addPhoto(title: newPhotoNoteTitle)
                    newPhotoNoteTitle = ""
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add Photo Note")
                }
            }
            .navigationTitle("Add New Note")
        }
    }
}

#Preview {
    struct Preview: View {
        @ObservedObject var homeViewModel = HomeViewModel()
        @State var title = ""
        
        var body: some View {
            AddNewPhotoNote(homeViewModel: homeViewModel, newPhotoNoteTitle: $title)
        }
    }
    
    return Preview()
}
