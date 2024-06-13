//
//  ContentView.swift
//  App599
//
//  Created by IGOR on 07/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Competitions

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {
                        
                        CompetitionsView()
                            .tag(Tab.Competitions)
                        
                        EventsView()
                            .tag(Tab.Events)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                OBR1()
            }
        }
    }
}

#Preview {
    ContentView()
}
