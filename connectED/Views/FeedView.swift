//
//  FeedView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/30/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack {
            FeedBackgroundView()
            
            VStack {
                Text("FEED ")
            }
        }
    }
}

struct FeedBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
