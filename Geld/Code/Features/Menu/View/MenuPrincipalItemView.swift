//
//  MenuPrincipalItemView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 09/04/24.
//

import SwiftUI

struct MenuPrincipalItemView: View
{
    var colecao: MenuColecao
    let height: CGFloat = 110
    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("botaoMenuColor"))
                .frame(height: colecao.name == "Abastecimento" ? 150 : height)

            Text(colecao.name)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(Color("textoBotaoMenuColor"))
                .offset(x: 1.0, y: 10)
                .padding()

        }.frame(minWidth: 230, maxWidth: .infinity, minHeight: height, maxHeight: 150)
    }
}
