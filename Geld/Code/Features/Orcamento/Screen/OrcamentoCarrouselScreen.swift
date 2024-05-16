//
//  OrcamentoScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 19/03/24.
//

import SwiftUI

struct OrcamentoIndividual: Hashable
{
    var valorAtual: Double
    var valorFinal: Double
}

@available(iOS 17.0, *)
struct OrcamentoCarrouselScreen: View
{
    @State private var currentSpeed = 140.0

    let orcamentos = [OrcamentoIndividual(valorAtual: 1, valorFinal: 12), OrcamentoIndividual(valorAtual: 2, valorFinal: 22), OrcamentoIndividual(valorAtual: 3, valorFinal: 23)]

    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("Orçamentos").font(.system(.largeTitle, design: .rounded).weight(.bold)).padding()
                Spacer()
                Image(systemName: "bell.fill")
                    .padding()
            }

            ScrollView(.horizontal)
            {
                LazyHStack(spacing: 40)
                {
                    ForEach(orcamentos, id: \.self) { orcamento in
                        OrcamentoView(valorAtual: orcamento.valorAtual, valorFinal: orcamento.valorFinal)
                            .padding(20)
                            .containerRelativeFrame(.horizontal, alignment: .center)
                            .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive, axis: .horizontal)
                            { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .scaleEffect(phase.isIdentity ? 1 : 0.55)
                                    .blur(radius: phase.isIdentity ? 0 : 10)
                            }
                    }
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollTargetLayout(isEnabled: true)
        }
    }
}

@available(iOS 17.0, *)
#Preview
{
    OrcamentoCarrouselScreen()
}
