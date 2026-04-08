//
//  HomePage.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack {
            Text("Bem vindo a HOME PAGE")
            
            NavigationLink(destination: BuscarPassagem(), label: {
                Text("Comprar Passagem")
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("azulEscuro"))
                    }
            })
        }
    }
}

#Preview {
    HomePage()
}
