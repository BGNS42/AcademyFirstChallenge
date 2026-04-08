//
//  InfoPassageiro.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct InfoPassageiro: View {
    var body: some View {
        VStack{
            Text("Coloque os dados do passageiro")
            NavigationLink(destination: InfoPagamento(), label: {
                Text("Confirmar dados")
            })
        }
    }
}

#Preview {
    InfoPassageiro()
}
