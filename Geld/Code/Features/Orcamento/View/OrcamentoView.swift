//
//  OrcamentoView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 11/05/24.
//

import SwiftUI

struct OrcamentoView: View 
{
    @Environment(\.locale) private var locale
    @State var valorAtual: Double
    @State var valorFinal: Double

    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: 25)
                .fill(.gray)
                .frame(width: 400, height: 400)

            Gauge(value: valorAtual, in: 0...valorFinal)
            {
                Image(systemName: "gauge.medium")
                    .font(.system(size: 10.0))
            } currentValueLabel: {
                Text("\(valorAtual.formatted(.currency(code: locale.currency?.identifier ?? "BRL")))")
            }
            .gaugeStyle(GaugeStylePB())
        }
    }
}

#Preview
{
    OrcamentoView(valorAtual: 140.0, valorFinal: 200.0)
}
