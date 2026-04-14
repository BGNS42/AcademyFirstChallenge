//
//  linhaPontilhada.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 14/04/26.
//

import SwiftUI

struct linhaPontilhada: View {
    var cor: Color = .gray.opacity(0.7)
    var larguraLinha: CGFloat = 1
    var tracejado: [CGFloat] = [6, 4]
    
    var body: some View {
        GeometryReader { geo in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geo.size.width, y: 0))
            }
            .stroke(
                cor,
                style: StrokeStyle(
                    lineWidth: larguraLinha,
                    dash: tracejado
                )
            )
        }
        .frame(height: 1)
        .padding(.vertical, 8)
    }
}

#Preview {
    linhaPontilhada()
}
