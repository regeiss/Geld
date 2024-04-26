//
//  PerfilView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/03/24.
//

import SwiftUI

struct PerfilDetalheView: View 
{
    @Binding var perfil: Perfil

    var body: some View
    {
        HStack
        {
            TextField(perfil.nome, text: $perfil.nome)
            Spacer()
        }.contentShape(Rectangle())
    }
}
