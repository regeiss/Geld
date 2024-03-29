//
//  TransacaoView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 25/03/24.
//

import SwiftUI

struct TransacaoView: View
{
    @State var transacoes = Transacao.sampleData
    @State var selectedCategory: String = "Diario"
    
    var body: some View
    {
        HStack
        {
            Text("Transações").font(.system(.title2, design: .rounded).weight(.bold)).padding(.leading, 15)
            Spacer()
        }

        Picker("",
               selection: $selectedCategory) {
            Text("Diário")
                .tag("Diario")
            Text("Semanal")
                .tag("Semanal")
            Text("Mensal")
                .tag("Mensal")
            Text("Anual")
                .tag("Anual")
        }.pickerStyle(.segmented).padding([.leading, .trailing], 10)

        ScrollView
        {
            ForEach(transacoes) { transacao in
                TransacaoDetalheView(transacao: transacao)
            }
        }
    }
}
