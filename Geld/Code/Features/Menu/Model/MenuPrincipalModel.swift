//
//  MenuPrincipalModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 09/04/24.
//

import Foundation

enum MenuPrincipalModel: String
{
    case categoria
    case servico
    case transferencias
    case alerta
    case cadastro
    case dashboard
}

struct MenuColecao: Identifiable, Hashable
{
    var id: Int
    var name: String
    var image: String
    var menu: MenuPrincipalModel
}
