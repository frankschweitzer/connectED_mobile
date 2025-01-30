//
//  ContentView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if authViewModel.isLoggedIn {
                HomeView()
            } else {
                AuthView()
            }
        }
    }
}

#Preview {
    ContentView()
}
