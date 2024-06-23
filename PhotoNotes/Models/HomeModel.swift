//
//  HomeModel.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/21/24.
//

import Foundation
import SwiftUI

// this is the HomeModel that I am using 
struct HomeModel: Identifiable {
    let id = UUID()
    var title: String
    var photo: Image
    var description: String
    
    init(title: String, photo: Image, description: String) {
        self.title = title
        self.photo = photo
        self.description = description
    }
}
