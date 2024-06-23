//
//  HomeView.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/21/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeViewModel: HomeViewModel = HomeViewModel()
    @State private var isHomeSheetActive = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(homeViewModel.homeModel) { photo in
                    NavigationLink(destination: PhotoNoteDestinationPage(photoNoteModel: photo)) {
                        Text(photo.title)
                    }
                }
            }
            .navigationTitle("Photo Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        self.isHomeSheetActive = true
                    }) {
                        Image(systemName: "plus")
                    }
                })
            }
            .sheet(isPresented: $isHomeSheetActive, content: {
                AddNewPhotoNote(homeViewModel: homeViewModel)
            })
        }
    }
}

#Preview {
    HomeView()
}
