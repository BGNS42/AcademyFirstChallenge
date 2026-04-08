//
//  PagamentoConfirmado.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct PagamentoConfirmado: View {
    @State private var isConcluded: Bool = false
    
    var body: some View {
        VStack{
            NavigationStack{
                VStack{
                    if isConcluded {
                        ContentView()
                    } else {
                        finale
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    @ViewBuilder
    var finale: some View {
        Text("Seu pagamento foi concluído!")
        LoginButtons(textBtn: "Voltar para Home", txtColor: "googleWhite", btnColor: "azulEscuro") {
            isConcluded = true
        }
    }
}

#Preview {
    PagamentoConfirmado()
}
