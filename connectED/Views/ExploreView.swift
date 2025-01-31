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
            VStack {
                Text("Explore Universities from across the US")
                    .font(.title)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(exploreViewModel.schools) { school in
                            SchoolCell(school: school)
                                .environmentObject(exploreViewModel)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct SchoolCell: View {
    let school: School
    @EnvironmentObject private var exploreViewModel: ExploreViewModel
    
    var body: some View {
        NavigationLink(destination: SchoolView(schoolId: school.id ?? "").environmentObject(exploreViewModel)) {
            VStack {
                Image(systemName: "building.columns.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .foregroundColor(.blue)
                Text(school.name ?? "")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()
            .frame(width: 160, height: 160)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
