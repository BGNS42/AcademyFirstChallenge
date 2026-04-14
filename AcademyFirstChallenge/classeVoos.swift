//
//  classeVoos.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 14/04/26.
//

import Foundation
import Observation

@Observable
class Voos {
    var origem: String = ""
    var destino: String = ""
    var dataIda: Date = Date()
    var dataVolta: Date = Date()
    var passageiros: Int = 1
    var classeAssentos: String = "Econômica"
    
    var tipoBagagem: String = "Light"
    var precoBagaem: String = "R$ 0,00"
    
    var vooIdaSelecionado: String?
    var vooVoltaSelecionado: String?
    
    var resumoBusca: String {
        "\(origem) - \(destino) | \(passageiros)"
    }
}
