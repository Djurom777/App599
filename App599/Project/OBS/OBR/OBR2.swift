//
//  OBR2.swift
//  App599
//
//  Created by IGOR on 07/06/2024.
//

import SwiftUI

struct OBR2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("OBR2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("All activities are at hand")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 60)
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        
                        status = true
                        
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
    OBR2()
}
