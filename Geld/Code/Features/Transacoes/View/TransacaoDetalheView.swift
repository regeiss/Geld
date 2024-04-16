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

            if isHome
            {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.thinMaterial)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 80)
                    .padding([.leading, .trailing], 10)
            }

            HStack
            {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: transacao.iconeCor) ?? .gray)
                        .frame(width: 45, height: 45)

                    Image(systemName: transacao.icone)
                        .imageScale(.large)
                        .colorInvert()
                }.padding(.leading, isHome ? 10 : 0)

                VStack(alignment: .leading)
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
                        .padding(.trailing, isHome ? 10 : 0)
                }
            }
        }
    }
}
