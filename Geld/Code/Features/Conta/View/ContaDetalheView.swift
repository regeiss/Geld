//
//  ContaDetalheView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 11/03/24.
//

import SwiftUI

struct ContaDetalheView: View
{
    @Binding var conta: ContaModel
    
    var body: some View
    {
        HStack
        {
            Text("Detalhe")
            TextField(conta.nome, text: $conta.nome)
            Spacer()
        }.contentShape(Rectangle())
    }
}

