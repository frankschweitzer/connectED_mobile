//
//  SchoolView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/30/25.
//

import SwiftUI

struct SchoolView: View {
    let schoolId: String
    let schoolName: String
    @EnvironmentObject private var exploreViewModel: ExploreViewModel
    
    var body: some View {
        ZStack {
            SchoolBackgroundView()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(exploreViewModel.degrees) { degree in
                        DegreeCard(degree: degree)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .onAppear {
                exploreViewModel.getDegrees(schoolId: schoolId)
            }
            .navigationTitle(schoolName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DegreeCard: View {
    let degree: Degree
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(degree.field ?? "Unknown Degree")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(degree.description ?? "Unknown Level")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "graduationcap.fill")
                .foregroundColor(.blue)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct SchoolBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
