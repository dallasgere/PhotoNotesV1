//
//  HomeView.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/21/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(homeViewModel.homeModel) { photo in
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
