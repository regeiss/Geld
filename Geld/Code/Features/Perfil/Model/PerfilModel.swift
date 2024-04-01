//
//  PerfilModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/03/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Perfil: Identifiable, Codable
{
    @DocumentID var id: String?
    var nome: String
}

extension Perfil
{
    static let collectionName = "perfil"
}
