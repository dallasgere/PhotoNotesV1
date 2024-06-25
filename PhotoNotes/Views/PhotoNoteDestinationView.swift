//
//  PhotoNoteDestinationView.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/24/24.
//

import SwiftUI
import PhotosUI
import MapKit

struct PhotoNoteDestinationView: View {
    @ObservedObject var photoNoteViewModel: PhotoNoteDestinationViewModel
    
    // view
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("image")) {
                    photoNoteViewModel.photoNoteModel.homeModel.photo
                        .resizable()
                        .scaledToFit()
                }
                Section(header: Text("description")) {
                    Text(photoNoteViewModel.photoNoteModel.homeModel.description)
                }
                Section(header: Text("location")) {
                    MapViewNew(coordinates: photoNoteViewModel.photoNoteModel.homeModel.coordinates, title: photoNoteViewModel.photoNoteModel.homeModel.title)
                        .scaledToFit()
                }
            }
            .navigationTitle(photoNoteViewModel.photoNoteModel.homeModel.title)
        }
    }
}

#Preview {
    struct Preview: View {
        let coordinates: CLLocationCoordinate2D
        var photoNoteModel: HomeModel
        var photoNoteViewModel: PhotoNoteDestinationViewModel
        
        init() {
            self.coordinates = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
            self.photoNoteModel = HomeModel(title: "hi", photo: Image(systemName: "plus"), description: "hi", coordinates: coordinates)
            self.photoNoteViewModel = PhotoNoteDestinationViewModel(photoNoteModel: PhotoNoteDestinationModel(homeModel: photoNoteModel))
        }
        
        var body: some View {
            PhotoNoteDestinationView(photoNoteViewModel: photoNoteViewModel)
        }
    }
    
    return Preview()
}
