//
//  Notif.swift
//  App599
//
//  Created by IGOR on 07/06/2024.
//

import SwiftUI

struct Notif: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Notif")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Don’t miss anything")
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .padding(5)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Notif()
}
