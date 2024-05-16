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

    var hex: String = ""
    var color: Color = .gray

    var body: some View
    {
        ZStack
        {
            // TODO: Revisar os tamanhos para home lista normal
            HStack
            {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: transacao.iconeCor) ?? .gray)
                        .frame(width: isHome ? 36 : 45, height: isHome ? 36 : 45)

                    Image(systemName: transacao.icone)
                        .imageScale(.large)
                        .colorInvert()
                }.padding(.leading, isHome ? 10 : 0)

                if isHome
                {
                    VStack(alignment: .leading)
                    {
                        Text(transacao.nome)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                        Text(transacao.data, format: Date.FormatStyle().year().month().day())
                            .font(.system(size: 10, weight: .light, design: .default))
                    }

                    Spacer()
                    VStack
                    {
                        Text(String(format: "%.2f", transacao.valor).toCurrencyFormat())
                            .font(.system(size: 15, weight: .light, design: .default))
                            .foregroundStyle(transacao.valor > 0 ? .blue : .red)
                            .padding(.trailing, 10)
                    }
                }
                else
                {
                    VStack(alignment: .leading)
                    {
                        Text(transacao.nome)
                            .bold()
                        Text(transacao.data, format: Date.FormatStyle().year().month().day())
                    }
                    Spacer()
                    VStack
                    {
                        Text(String(format: "%.2f", transacao.valor).toCurrencyFormat())
                            .bold()
                            .foregroundStyle(transacao.valor > 0 ? .blue : .red)
                            .padding(.trailing, isHome ? 10 : 5)
                    }
                }
            }
        }
    }
}

