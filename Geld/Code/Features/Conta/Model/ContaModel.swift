//
//  ContaModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 10/03/24.
//

import Foundation
import FirebaseFirestoreSwift

struct ContaModel: Identifiable, Codable
{
    @DocumentID var id: String?
    var nome: String
}

extension ContaModel
{
    static let samples = [
        ContaModel(nome: "CEF"),
        ContaModel(nome: "Safra"),
        ContaModel(nome: "Itau"),
        ContaModel(nome: "BTG")
    ]
}

extension ContaModel
{
    static let collectionName = "conta"
}
