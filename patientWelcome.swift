////
////  patientWelcome.swift
////  Royals Hospital
////
////  Created by Bilal's MacBook👑 on 15/02/2024.
////
//
import SwiftUI

//Welcome Screen after the patient Sign Up
struct patientWelcome: View {
    var body: some View {
        
        ZStack{
            Image("Image4")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            Text("Account Created Successfully")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .frame(alignment: .center)
                 .background(Color.black.opacity(0.7))
                 .cornerRadius(15)
                 .offset(y: -30)


            .navigationTitle("Patient")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "house.fill")
                }
            }
        }
    }
}
