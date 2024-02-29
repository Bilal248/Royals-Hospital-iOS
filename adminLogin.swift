////
////  adminLogin.swift
////  Royal'sHospital
////
////  Created by Bilal's MacBook👑 on 03/02/2024.

import SwiftUI
import FirebaseAuth

//Admin Login Screen with authentication
class AuthManager: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated: Bool = false

    init() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            self.user = user
            self.isAuthenticated = user != nil
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}



struct adminLogin: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var errorMessage: String?
    @State private var navigationIsActive: Bool = false
    
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Image6")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                VStack{
                    TextField("Email", text: $email)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ZStack {
                        NavigationLink(destination: AdminLoginView(), isActive: $navigationIsActive) {
                            EmptyView()
                            Button("Login") {
                                navigationIsActive = true
                            }
                            .font(.system(size: 22))
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text(errorMessage ?? "An unknown error occurred."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            }
            
            .padding()
            .navigationTitle("Admin Login")
        }
    }
}






















