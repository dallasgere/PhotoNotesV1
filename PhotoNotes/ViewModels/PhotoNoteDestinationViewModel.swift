//
//  PhotoNoteDestinationViewModel.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/24/24.
//

import Foundation

class PhotoNoteDestinationViewModel: ObservableObject {
    @Published var photoNoteModel: PhotoNoteDestinationModel // model for any other operations here, yet to be applied
    
    init(photoNoteModel: PhotoNoteDestinationModel) {
        self.photoNoteModel = photoNoteModel
    }
}
