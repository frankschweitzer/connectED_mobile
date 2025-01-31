//
//  ExploreView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/30/25.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @ObservedObject var exploreViewModel: ExploreViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ExploreBackgroundView()
                
                VStack(spacing: 20) {
                    Text("Explore Universities")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(exploreViewModel.schools) { school in
                                SchoolCell(school: school)
                                    .environmentObject(exploreViewModel)
                                    .transition(.scale)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct SchoolCell: View {
    let school: School
    @EnvironmentObject private var exploreViewModel: ExploreViewModel
    
    var body: some View {
        NavigationLink(destination: SchoolView(schoolId: school.id ?? "", schoolName: school.name ?? "").environmentObject(exploreViewModel)) {
            VStack(spacing: 8) {
                Image(systemName: "building.columns.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .foregroundColor(.blue)
                
                Text(school.name ?? "")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 10)
            }
            .padding()
            .frame(width: 160, height: 160)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
            )
            .scaleEffect(1.0)
            .onAppear {
                withAnimation(.spring()) {}
            }
        }
    }
}

struct ExploreBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
