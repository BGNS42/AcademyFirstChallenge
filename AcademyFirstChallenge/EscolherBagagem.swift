//
//  EscolherBagagem.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct EscolherBagagem: View {
    var body: some View {
        VStack{
            Text("Escolha sua opção de Bagagem")
            NavigationLink(destination: InfoPassageiro(), label: {
                Text("Escolher Bagagem")
            })
        }
    }
}

#Preview {
    EscolherBagagem()
}
