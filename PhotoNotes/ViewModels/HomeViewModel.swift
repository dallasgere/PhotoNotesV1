//
//  HomeViewModel.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/21/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var homeModel: [HomeModel] = []
    
    func addPhoto(title: String) {
        let newPhoto = HomeModel(title: title)
        self.homeModel.append(newPhoto)
    }
    
    func sortNotes() {
        self.homeModel.sort(by: {
            $0.title < $1.title
        })
    }
}
