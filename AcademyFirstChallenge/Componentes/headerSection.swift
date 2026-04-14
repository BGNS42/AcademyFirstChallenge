//
//  headerSection.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 14/04/26.
//

import SwiftUI

struct headerSection: View {
    var pageTitle: String = "Page Title"
    var pageIcon: String = ""
    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 10){
                Image(systemName: "bell.fill")
                    .foregroundStyle(Color.offWhite)
                    .font(.title3)
                    .opacity(0)
                
                Spacer()
                
                VStack {
                    Image(pageIcon)
                    
                    Text(pageTitle)
                        .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                        .foregroundStyle(Color.offWhite)
                }
                
                Spacer()
                
                Image(systemName: "bell.fill")
                    .foregroundStyle(Color.offWhite)
                    .font(.title3)
            }
            .padding()
        }
        .padding(.horizontal)
        .padding(.top, -70) // PADDING PRA POSICIONAR HEADER NA MESMA LINHA DO BOTAO DE VOLTAR
    }
}


#Preview {
    headerSection()
}
