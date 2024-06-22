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
        }
    }
}

#Preview {
    HomeView()
}
