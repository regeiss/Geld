//
//  ContaDetalheView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 11/03/24.
//

import SwiftUI

struct ContaDetalheView: View
{
    @Binding var conta: Conta
    
    // MARK: - Body
    var body: some View
    {
        HStack
        {
            TextField(conta.nome, text: $conta.nome)
            Spacer()
        }.contentShape(Rectangle())
    }
}
