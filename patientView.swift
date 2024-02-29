//
//  patientView.swift
//  Royal'sHospital
//
//  Created by Bilal's MacBook👑 on 03/02/2024.
//
import SwiftUI

//Patient Sign in and Sign Up Screen
struct patient: View {
    @State private var p_username: String = ""
    @State private var p_password: String = ""
    var body: some View {
        
        ZStack{
            Image("Image4")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
            VStack {
                //Text Field for username
                TextField("Enter Your Username", text: $p_username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //Field for password
                SecureField("Enter Your Password", text: $p_password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //Sign in button
                Button("Sign in") {
                    // Action to be performed when the button is tapped
                    //Currently no Functionality
                }
                .font(.system(size: 22))
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                
                //Link in text to account creation for patient
                HStack {
                    Text("New? Click to")
                    .foregroundColor(Color.white)
                    .font(.system(size: 22))
                    NavigationLink(destination: signUpPatient()) {
                        Text("Create Account")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    }
                }
            }
            .navigationTitle("Patient Sign In")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                        Image(systemName: "house.fill")
                }
                }
        }
    }
}

