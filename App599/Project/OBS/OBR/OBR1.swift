//
//  OBR1.swift
//  App599
//
//  Created by IGOR on 07/06/2024.
//

import SwiftUI

struct OBR1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("OBR1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Convenient functionality and ease of learning")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 60)
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
                        
                        OBR2()
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
    OBR1()
}
