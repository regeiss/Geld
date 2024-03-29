//
//  BancoDetalheView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 18/03/24.
//

import SwiftUI

struct BancoDetalheView: View
{
    @Binding var banco: Banco
    
    var body: some View
    {
        HStack
        {
            TextField(banco.nome, text: $banco.nome)
            Spacer()
        }.contentShape(Rectangle())
    }
}
