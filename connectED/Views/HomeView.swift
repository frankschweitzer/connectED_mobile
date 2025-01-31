//
//  HomeView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/29/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        TabView {
            
            Tab("Explore", systemImage: "folder") {
                ExploreView(exploreViewModel: ExploreViewModel())
            }
            
            Tab("For You", systemImage: "pencil") {
                FeedView()
            }
            
            Tab("Settings", systemImage: "person") {
                SettingsView()
            }
        }
    }
}
