//
//  HomeView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/29/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @State private var selectedTab = 0
    @StateObject private var exploreViewModel = ExploreViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ExploreView(exploreViewModel: exploreViewModel)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 0 ? .black : .white)
                    Text("Explore")
                }
                .tag(0)
            
            FeedView()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 1 ? .black : .white)
                    Text("For You")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 2 ? .black : .white)
                    Text("Settings")
                }
                .tag(2)
        }
        .accentColor(.black)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = UIColor.white
        }
        .toolbarBackground(.clear, for: .tabBar)
    }
}
