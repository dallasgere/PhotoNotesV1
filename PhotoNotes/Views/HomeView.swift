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
    @State private var photoNoteTitle = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(homeViewModel.homeModel) { photo in
                    //                    Text(photo.title)
                    NavigationLink(destination: TestView(photo: photo.photo)) {
                        Text("hello")
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
                AddNewPhotoNote(homeViewModel: homeViewModel, newPhotoNoteTitle: $photoNoteTitle)
            })
        }
    }
}

struct TestView: View {
    @State var photo: Image
    
    var body: some View {
        photo
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    }
}

#Preview {
    HomeView()
}
