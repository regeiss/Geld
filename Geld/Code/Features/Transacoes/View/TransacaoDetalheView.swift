//
//  TransacaoDetalheView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 24/03/24.
//

import SwiftUI

struct TransacaoDetalheView: View
{
    @Binding var transacao: Transacao
    var isHome: Bool

    var body: some View
    {
        ZStack
        {

            if isHome
            {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.thinMaterial)
                    .frame(width: .infinity, height: 80)
                    .padding([.leading, .trailing], 10)
            }

            HStack
            {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: transacao.iconeCor))
                        .frame(width: 45, height: 45)

                    Image(systemName: transacao.icone)
                        .imageScale(.large)
                        .colorInvert()
                }.padding(.leading, 10)

                VStack(alignment: .leading, spacing: 2)
                {
                    Text(transacao.nome).bold()
                    Text(transacao.data, format: Date.FormatStyle().year().month().day())
                }

                Spacer()
                VStack
                {
                    Text(String(format: "%.2f", transacao.valor).toCurrencyFormat())
                        .bold()
                        .foregroundStyle(transacao.valor > 0 ? .blue : .red)
                        .padding(.trailing, 10)
                }
            }
//            .frame(width: .infinity, height: 80)
//            .padding([.leading, .trailing], 10)
        }
    }
}
