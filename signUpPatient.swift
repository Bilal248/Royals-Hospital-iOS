//
//  signUpPatient.swift
//  Royal'sHospital
//
//  Created by Bilal's MacBook👑 on 05/02/2024.
//

import SwiftUI
import UIKit
import FirebaseAuth
import FirebaseFirestore


//Sign Up screen for patient
struct signUpPatient: View {

    @State private var f_name: String = ""
    @State private var l_name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var showAlert = false
    @State private var navigationIsActive: Bool = false

    let alertItem: String = "Please fill all the fields"
    
    @State private var whitespacesAndNewlines = [" ","\n"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Image5")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack {
                    //Text Field for username
                    HStack{
                        TextField("First Name", text: $f_name)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        //Text Field for password
                        TextField("Last Name", text: $l_name)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    VStack{
                        //Text Field for email
                        TextField("Email", text: $email)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        //Text Field for password
                        SecureField("Password", text: $password)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        ZStack {
                            NavigationLink(destination: patientWelcome(), isActive: $navigationIsActive) {
                                EmptyView()
                                //Sign Up button
                                Button("Sign Up") {
                                    // Action to be performed when the button is tapped
                                    print("Button tapped!")
                                    let error = validateFields()//Checks if all the fields are filled
                                    if error != nil {
                                        errorMessage = error
                                        showAlert.toggle()
                                    }
                                    else{
                                        print(f_name)
                                        print(l_name)
                                        print(email)
                                        print(password)
                                        

                                        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                                            if err != nil{
                                                showAlert.toggle()
                                            }
                                            else{
                                                let firstName = f_name
                                                let lastName = l_name
                                                let email = self.email
                                                let password = self.password
                                                
                                                let db = Firestore.firestore()
                                                

                                                db.collection("user").addDocument(data: ["firstName" : firstName, "lastName" : lastName ,
                                                 "uid": result!.user.uid ]) { (error) in
                                                    if error != nil{

                                                        showAlert.toggle()                                                    }
                                                }
                                                navigationIsActive = true
                                            }
                                        }
                                    }
                                }
                                .font(.system(size: 22))
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(20)
                            }
                            .navigationTitle("Patient Sign Up")
                            //Toolbar on each screen top
                            .toolbar{
                                ToolbarItem(placement: .navigationBarTrailing){
                                    Image(systemName: "house.fill")
                                }
                            }
                            .padding()
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Alert"),
                                message: Text(errorMessage ?? "An unknown error occurred."),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                    }
                }
            }
        }
    }
    public func validateFields () -> String? {
        
        // Check that all fields are filled in patient sign up
        if  f_name.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                l_name.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                email.trimmingCharacters(in:  .whitespacesAndNewlines) == "" ||
                password.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        return nil
    }
}


