//
//  AddNewPhotoNote.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/22/24.
//

import SwiftUI
import PhotosUI

struct AddNewPhotoNote: View {
    // passing in the view model and title to add back in
    @ObservedObject var homeViewModel: HomeViewModel
    @Binding var newPhotoNoteTitle: String
    
    // this allows to close the sheet after the button has been pressed
    @Environment(\.presentationMode) var presentationMode
    
    // these is for the photo picker
    @State private var photoItem: PhotosPickerItem?
    @State private var photo: Image?
    
    // view
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    TextField("New Todo", text: $newPhotoNoteTitle)
                    
                    Button(action: {
                        if let sureImage = self.photo {
                            homeViewModel.addPhoto(title: newPhotoNoteTitle, photo: sureImage)
                        }
                        newPhotoNoteTitle = ""
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Add Photo Note")
                    }
                }
                .navigationTitle("Add New Note")
            }
            
            PhotosPicker("select photo", selection: $photoItem, matching: .images)
            
//            photo?
//                .resizable()
//                .scaledToFit()
//                .frame(width: 300, height: 300)
        }
        .onChange(of: photoItem) {
            Task {
                if let loadedImage = try? await photoItem?.loadTransferable(type: Image.self) {
                    photo = loadedImage
                } else {
                    print("failed to load image")
                }
            }
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
