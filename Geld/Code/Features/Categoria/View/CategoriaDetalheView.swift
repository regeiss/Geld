//
//  CategoriaDetalheView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 27/03/24.
//

import SwiftUI

struct CategoriaDetalheView: View 
{
    @Binding var categoria: Categoria

    var body: some View 
    {
        HStack
        {
            TextField(categoria.nome, text: $categoria.nome)
            Spacer()
        }.contentShape(Rectangle())
    }
}

//#Preview {
//    CategoriaDetalheView()
//}
