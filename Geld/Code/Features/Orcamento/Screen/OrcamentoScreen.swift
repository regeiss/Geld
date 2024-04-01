//
//  OrcamentoScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 19/03/24.
//

import SwiftUI

struct OrcamentoScreen: View
{
    @State private var currentSpeed = 140.0

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

            ZStack
            {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.gray)
                    .frame(width: 400, height: 400)

                Gauge(value: currentSpeed, in: 0...200)
                {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 50.0))
                } currentValueLabel: {
                    Text("\(currentSpeed.formatted(.number))")
                }
                .gaugeStyle(GaugeStylePB())
            }
            Spacer()
        }
    }
}

//#Preview {
//    OrcamentoScreen()
//}
