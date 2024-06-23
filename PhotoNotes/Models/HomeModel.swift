//
//  HomeModel.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/21/24.
//

import Foundation
import SwiftUI
import PhotosUI
import CoreImage

// this is the HomeModel that I am using 
struct HomeModel: Identifiable {
    let id = UUID()
    var title: String
    var photo: Image
    var description: String
    var coordinates: CLLocationCoordinate2D
    
    init(title: String, photo: Image, description: String, coordinates: CLLocationCoordinate2D) {
        self.title = title
        self.photo = photo
        self.description = description
        self.coordinates = coordinates
    }
}
