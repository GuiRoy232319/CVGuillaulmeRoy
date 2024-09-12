//
//  ContentView.swift
//  CVGuillaulmeRoy
//
//  Created by guill roy on 05/09/2024.
//

import SwiftUI

struct MainView: View {
   
    var body: some View {
        TabView{
            ProfilView()
                .tabItem{
                    Label("Mon Profil", systemImage: "person.fill")
                }
            Schedule2024View()
                .tabItem{
                    Label("Exemple API Golf", systemImage: "figure.golf")
                }
            AuroraForecastView()
                .tabItem{
                    Label("Exemple Données Aurore", systemImage: "cloud.rainbow.half.fill")
                }
        }
       
#if os(macOS)
        .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        .toolbar {
#if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Partager", systemImage: "square.and.arrow.up", role: .none) {
                    
                }
                .foregroundStyle(.yellow, .orange)
            }
#endif
        }
        .tabViewStyle(.automatic)
        .foregroundStyle(.black, .orange)
    }
}


#Preview {
    MainView()
}
