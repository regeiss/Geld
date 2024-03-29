//
//  CategoriaModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 26/03/24.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseCore

struct Categoria: Identifiable, Codable
{
    @DocumentID var id: String?
    var nome: String
}

extension Categoria
{
    static let collectionName = "categoria"
}
