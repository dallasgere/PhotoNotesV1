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
                    NavigationLink(destination: TestView(title: photo.title, description: photo.description, photo: photo.photo)) {
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

struct TestView: View {
    @State var title: String
    @State var description: String
    @State var photo: Image
    
    var body: some View {
        Text(title)
        Text(description)
        photo
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    }
}

#Preview {
    HomeView()
}
