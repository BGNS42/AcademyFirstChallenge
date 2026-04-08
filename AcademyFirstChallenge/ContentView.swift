//
//  ContentView.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem{Label("HOME", systemImage: "house")}
            MeusVoos()
                .tabItem{
                    Label {
                        Text("Meus Voos")
                    } icon: {
                        Image(systemName: "airplane")
                        //Tentar rotacionar esse ícone
                    }
                }
            Profile()
                .tabItem{Label("Perfil", systemImage: "person")}
        }
        
//        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.tabBarOnly)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
