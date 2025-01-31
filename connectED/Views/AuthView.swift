//
//  AuthView.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/29/25.
//

import SwiftUI

struct AuthView: View {
    @State private var isRegistering = false
    
    var body: some View {
        ZStack {
            AuthBackgroundView()
            VStack {
                if isRegistering {
                    RegisterView(isRegistering: $isRegistering)
                        .transition(.slide)
                } else {
                    LoginView(isRegistering: $isRegistering)
                        .transition(.slide)
                }
            }
            .padding()
        }
        .animation(.easeInOut, value: isRegistering)
    }
}

struct LoginView: View {
    @Binding var isRegistering: Bool
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("connectED")
                .font(.largeTitle)
                .bold()
                .italic()
            
            TextField("Email", text: $email)
                .modifier(TextFieldModifier())
            
            SecureField("Password", text: $password)
                .modifier(TextFieldModifier())
            
            Button("Login") {
                authViewModel.login(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            
            Button("Don't have an account? Sign Up") {
                isRegistering.toggle()
            }
            .foregroundColor(.blue)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 5))
        .padding()
    }
}

struct RegisterView: View {
    @Binding var isRegistering: Bool
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var displayName = ""
    @State private var university = ""
    @State private var major = ""
    @State private var email = ""
    @State private var password = ""
    
    let universities = ["Wake Forest", "Harvard"]
    let majors = ["Computer Science", "Mathematics"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .bold()
            
            TextField("First Name", text: $firstName)
                .modifier(TextFieldModifier())
            
            TextField("Last Name", text: $lastName)
                .modifier(TextFieldModifier())
            
            TextField("Username", text: $displayName)
                .modifier(TextFieldModifier())
            
            Picker("Select Your University", selection: $university) {
                ForEach(universities, id: \.self) { uni in
                    Text(uni).tag(uni)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            Picker("Select Your Major", selection: $major) {
                ForEach(majors, id: \.self) { major in
                    Text(major).tag(major)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            TextField("Email", text: $email)
                .modifier(TextFieldModifier())
            
            SecureField("Password", text: $password)
                .modifier(TextFieldModifier())
            
            Button("Register") {
                authViewModel.register(email: email, password: password, firstName: firstName, lastName: lastName, displayName: displayName, university: university, major: major)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            
            Button("Already have an account? Log In") {
                isRegistering.toggle()
            }
            .foregroundColor(.blue)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 5))
        .padding()
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .shadow(radius: 1)
            .padding(.horizontal)
    }
}

struct AuthBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
