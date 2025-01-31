//
//  SettingsView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/30/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Settings")
            Button("Logout") {
                authViewModel.logout()
            }
        }
        
    }
}
