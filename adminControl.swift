//
//  adminControl.swift
//  Royal'sHospital
//
//  Created by Bilal's MacBook👑 on 03/02/2024.
//

import SwiftUI
import Firebase
import FirebaseFirestore

//Screen after Admin Login Successfully
struct AdminLoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack{
            Image("Image3")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            Text("Admin Login Successfully")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .frame(alignment: .center)
                .background(Color.black.opacity(0.7))
                .cornerRadius(15)
                .offset(y: -30)
            
            .navigationTitle("Admin")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "house.fill")
                }
            }
        }
        .padding()
    }
}
