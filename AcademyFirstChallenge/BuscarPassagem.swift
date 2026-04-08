//
//  BuscarPassagem.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct BuscarPassagem: View {
    var body: some View {
        VStack{
            Text("Escolha seu destino")
            NavigationLink(destination: VoosIda(), label: {
                Text("Buscar Passagem")
            })
        }
    }
}

#Preview {
    BuscarPassagem()
}
