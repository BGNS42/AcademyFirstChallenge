//
//  VoosVolta.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct VoosVolta: View {
    var body: some View {
        VStack{
            Text("Escolha o Voo de Volta")
            NavigationLink(destination: EscolherBagagem(), label: {
                Text("Escolher Volta")
            })
        }
    }
}

#Preview {
    VoosVolta()
}
