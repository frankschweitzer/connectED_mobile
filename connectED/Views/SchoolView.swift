//
//  SchoolView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/30/25.
//

import SwiftUI

struct SchoolView: View {
    let schoolId: String
    @EnvironmentObject private var exploreViewModel: ExploreViewModel
    
    var body: some View {
        VStack {
            Text("Degrees at ")
                .font(.title)
                .padding()
            
            List(exploreViewModel.degrees) { degree in
                Text(degree.field ?? "")
            }
        }
        .onAppear {
            exploreViewModel.getDegrees(schoolId: schoolId)
        }
    }
}
