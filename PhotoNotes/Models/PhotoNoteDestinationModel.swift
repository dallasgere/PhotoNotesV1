//
//  PhotoNoteDestinationModel.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/24/24.
//

import Foundation

class PhotoNoteDestinationModel: ObservableObject {
    @Published var homeModel: HomeModel
    
    init(homeModel: HomeModel) {
        self.homeModel = homeModel
    }
}
