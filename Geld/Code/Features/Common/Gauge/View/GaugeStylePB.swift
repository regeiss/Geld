//
//  GaugeStyle.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 20/03/24.
//

import SwiftUI

struct GaugeStylePB: GaugeStyle 
{
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 247/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)

    func makeBody(configuration: Configuration) -> some View 
    {
        ZStack 
        {
            Circle()
                .foregroundColor(Color(.systemGray6))
                .rotationEffect(.degrees(145))
            Circle()
                .trim(from: 0, to: 0.55 * configuration.value)
                .stroke(purpleGradient, lineWidth: 20)
                .rotationEffect(.degrees(145))

            VStack 
            {
                configuration.currentValueLabel
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
            }
        }
        .frame(width: 300, height: 300)
    }
 
}
