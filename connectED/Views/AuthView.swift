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
        VStack {
            if isRegistering {
                RegisterView(isRegistering: $isRegistering)
            } else {
                LoginView(isRegistering: $isRegistering)
            }
        }
    }
}

struct LoginView: View {
    @Binding var isRegistering: Bool
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Login") {
                authViewModel.login(email: email, password: password)
            }
            .padding()
            
            Button("Don't have an account? Sign Up") {
                isRegistering.toggle()
            }
            .padding()
        }
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
        VStack {
            Text("Register")
                .font(.largeTitle)
                .bold()
            
            TextField("First Name", text: $firstName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Last Name", text: $lastName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Username", text: $displayName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
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
            .pickerStyle(WheelPickerStyle())
            .padding()
            
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Register") {
                authViewModel.register(email: email, password: password, firstName: firstName, lastName: lastName, displayName: displayName, university: university, major: major)
            }
            .padding()
            
            Button("Already have an account? Log In") {
                isRegistering.toggle()
            }
            .padding()
        }
        .padding()
    }
}
