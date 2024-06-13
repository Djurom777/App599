//
//  LoadingView.swift
//  App599
//
//  Created by IGOR on 07/06/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Mainlogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(50)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
