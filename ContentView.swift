//
//  ContentView.swift
//  Royal'sHospital
//
//  Created by Bilal's MacBook👑 on 02/02/2024.
//

import SwiftUI

//Main Screen after the Launch Screen
struct ContentView: View {
    @State private var isNavigationActive: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Image2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
                VStack {
                    NavigationLink(destination: adminLogin()) {
                        Text("Admin")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .frame(maxWidth: .infinity)
                    }
                    .shadow(color: .black, radius: 15, y: 5)
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    NavigationLink(destination: patient()) {
                        Text("Patient")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .frame(maxWidth: .infinity)
                    }
                    .shadow(color: .black, radius: 15, y: 5)
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                            Image(systemName: "house.fill")
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Image(systemName: "gear")
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
        
#Preview {
    ContentView()
}

