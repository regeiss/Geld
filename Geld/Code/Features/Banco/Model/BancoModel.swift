//
//  BancoModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 18/03/24.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseCore

struct Banco: Identifiable, Codable
{
    @DocumentID var id: String?
    var nome: String
}

extension Banco
{
    static let collectionName = "banco"
}
