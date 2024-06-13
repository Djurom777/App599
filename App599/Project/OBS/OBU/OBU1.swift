//
//  OBU1.swift
//  App599
//
//  Created by IGOR on 07/06/2024.
//

import SwiftUI

struct OBU1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("OBU1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Play and win with us")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 60)
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            .padding()
                    })
                }
                .frame(maxWidth: .infinity)
                .frame(height: 140)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    OBU1()
}
