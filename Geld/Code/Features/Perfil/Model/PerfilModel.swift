//
//  PerfilModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/03/24.
//

import Foundation
import FirebaseFirestoreSwift

enum DefaultSettings 
{
    // Color Slider Values
    static var rValue: Double = 150.0
    static var gValue: Double = 150.0
    static var bValue: Double = 150.0

    // Profile
    static var name: String = "Johny Appleseed"
    static var subtitle: String = "Developer"
    static var description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non arcu risus quis varius quam. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Ornare suspendisse sed nisi lacus sed viverra tellus. Arcu odio ut sem nulla pharetra. Vitae congue mauris rhoncus aenean vel elit. Scelerisque eu ultrices vitae auctor eu."
}

struct Perfil: Identifiable, Codable
{
    @DocumentID var id: String?
    var nome: String
}

extension Perfil
{
    static let collectionName = "perfil"
}
