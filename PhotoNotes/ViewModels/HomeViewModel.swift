//
//  HomeViewModel.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/21/24.
//

import Foundation
import CoreImage
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var homeModel: [HomeModel] = []
    
    // Don't need this init function yet but I think this is how I will initialize the list of photo notes.
    // At some point I want to save the notes in iCloud and I will ask for that information through this init function.
//    init() {
//    }
    
    // adding a new photo note to the list of photo notes
    func addPhoto(title: String, photo: Image, description: String) {
        let newPhoto = HomeModel(title: title, photo: photo, description: description)
        self.homeModel.append(newPhoto)
    }
    
    // sorting the list of notes by the title
    func sortNotes() {
        self.homeModel.sort(by: {
            $0.title < $1.title
        })
    }
}
