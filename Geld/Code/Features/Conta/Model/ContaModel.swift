//
//  ContaModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 10/03/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Conta: Identifiable, Codable
{
    @DocumentID var id: String?
    var nome: String
}

extension Conta
{
    static let collectionName = "conta"
}
