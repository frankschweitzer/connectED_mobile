//
//  connectEDApp.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/29/25.
//

import SwiftUI
import Firebase

@main
struct connectEDApp: App {
    @StateObject var authViewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
