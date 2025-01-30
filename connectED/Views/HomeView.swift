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
        VStack {
            Text("WELCOME \(authViewModel.user?.displayName ?? "")")
                .padding()
            Button("Logout") {
                authViewModel.logout()
            }
        }
    }
}
