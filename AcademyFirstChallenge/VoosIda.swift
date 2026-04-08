//
//  VoosIda.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct VoosIda: View {
    var body: some View {
        VStack{
            Text("Escolher Voo de Ida")
            NavigationLink(destination: VoosVolta(), label: {
                Text("Escolher Ida")
            })
        }
    }
}

#Preview {
    VoosIda()
}
