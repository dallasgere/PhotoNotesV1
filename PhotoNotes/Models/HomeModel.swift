//
//  HomeModel.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/21/24.
//

import Foundation

// this is the HomeModel that I am using 
struct HomeModel: Identifiable {
    let id = UUID()
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
