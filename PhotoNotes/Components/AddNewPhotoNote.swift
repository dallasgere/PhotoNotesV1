//
//  AddNewPhotoNote.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/22/24.
//

import SwiftUI
import PhotosUI

struct AddNewPhotoNote: View {
    // passing in the view model
    @ObservedObject var homeViewModel: HomeViewModel
    
    // title
    @State var newPhotoNoteTitle = ""
    
    // description
    @State var newPhotoNoteDescription = ""
    
    // this allows to close the sheet after the button has been pressed
    @Environment(\.presentationMode) var presentationMode
    
    // these is for the photo picker
    @State private var photoItem: PhotosPickerItem?
    @State private var photo: Image?
    
    // location data
    @State private var location: CLLocationCoordinate2D?
    
    // view
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    // title
                    TextField("Photo Note Title", text: $newPhotoNoteTitle)
                    
                    // description
                    ZStack(alignment:.topLeading) {
                        if newPhotoNoteDescription.isEmpty {
                            Text("Description...")
                                .foregroundColor(.gray)
                        }
                        TextEditor(text: $newPhotoNoteDescription)
                            .frame(height: 100)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                    }
                    
                    // photo picker with preview
                    HStack {
                        // Photo preview
                        if let loadedImage = photo {
                            loadedImage
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.gray)
                                .font(.body)
                            
                            PhotosPicker("select photo", selection: $photoItem, matching:.images)
                                .onAppear {
                                    Task {
                                        if let loadedImage = try? await photoItem?.loadTransferable(type: Image.self) {
                                            photo = loadedImage
                                        } else {
                                            print("Failed to load image")
                                        }
                                    }
                                }
                        }
                    }
                    
                    // add button
                    Button(action: {
                        if let sureImage = self.photo, let coordinates = location {
                            homeViewModel.addPhoto(title: newPhotoNoteTitle, photo: sureImage, description: newPhotoNoteDescription, coordinates: coordinates)
                        } else {
                            print("unable to add phot note")
                        }
                        newPhotoNoteTitle = ""
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Add Photo Note")
                    }
                }
                .navigationTitle("Add New Note")
            }
        }
        .onChange(of: photoItem) {
            Task {
                // getting the photo
                if let loadedImage = try? await photoItem?.loadTransferable(type: Image.self) {
                    photo = loadedImage
                } else {
                    print("failed to load image")
                }
                
                // getting the photos location data
                if let imageData = try? await photoItem?.loadTransferable(type: Data.self) {
                    location = AddNewPhotoNoteUtil.getLocationData(from: imageData)
                    print("Latitude::::::::::::::::::: \(String(describing: location?.latitude))")
                    print("Longitude:::::::::::::::::: \(String(describing: location?.longitude))")
                } else {
                    print("could not get the location")
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
            AddNewPhotoNote(homeViewModel: homeViewModel, newPhotoNoteTitle: title)
        }
    }
    
    return Preview()
}
