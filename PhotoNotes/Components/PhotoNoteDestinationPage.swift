//
//  PhotoNoteDestinationPage.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/22/24.
//

import SwiftUI

struct PhotoNoteDestinationPage: View {
    var photoNoteModel: HomeModel
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("image")) {
                    photoNoteModel.photo
                        .resizable()
                        .scaledToFit()
                }
                Section(header: Text("description")) {
                    Text(photoNoteModel.description)
                }
            }
            .navigationTitle(photoNoteModel.title)
        }
    }
}

#Preview {
    struct Preview: View {
        var photoNoteViewModel: HomeModel = HomeModel(title: "hi", photo: Image("system.plus"), description: "hi")
        
        var body: some View {
            PhotoNoteDestinationPage(photoNoteModel: photoNoteViewModel)
        }
    }
    
    return Preview()
}
