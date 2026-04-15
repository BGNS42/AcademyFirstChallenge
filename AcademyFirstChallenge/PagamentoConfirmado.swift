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
            if isConcluded {
                MeusVoos()
            } else {
                finale
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    var finale: some View {
        VStack(spacing: 8){
            Spacer()
            ZStack{
                Image("logoPagamento")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            .padding()
                
                Text("Pagamento Aprovado!")
                    .font(.custom("Poppins-SemiBold", size: 28))
                
                Text("Obrigado por comprar conosco! Boraí?")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.gray)
            
            VStack{

                Button {
                    isConcluded = true }
                label: {
                    boraiBtn(textBtn: "Meus Voos", txtColor: .offWhite, btnColor: .azulEscuro)
                }
                .padding(.horizontal)

                    
                }
            .padding(30)
            
            Spacer()
                
                
        
        
                
            }
        .padding()
        }
    }


#Preview {
    PagamentoConfirmado()
}
