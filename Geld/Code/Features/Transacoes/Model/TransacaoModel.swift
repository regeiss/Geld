//
//  TransacaoModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 24/03/24.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseCore

struct Transacao: Identifiable, Codable
{
    @DocumentID var id: String?
    var icone: String
    var iconeCor: String
    var nome: String
    var data: Date
    var valor: Double
}

extension Transacao
{
    static let collectionName = "transacao"
    static let sampleData = [
        Transacao(id: "1", icone: "fuelpump", iconeCor: "0x0d98ba", nome: "Teste", data: Date(), valor: 10.3),
        Transacao(id: "2", icone: "cart", iconeCor: "0x0b6000f", nome: "Teste2", data: Date(), valor: -4.3),
        Transacao(id: "3", icone: "briefcase", iconeCor: "0x36436f", nome: "Teste4", data: Date(), valor: 4.44),
        Transacao(id: "4", icone: "washer", iconeCor: "0xffc300", nome: "Teste5", data: Date(), valor: 6.44),
        Transacao(id: "5", icone: "car", iconeCor: "0x25d366", nome: "Teste6", data: Date(), valor: 4.44)
    ]
}
