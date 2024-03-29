//
//  ColorExtension.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 25/03/24.
//

import SwiftUI

extension Color
{
    init(hex: Int, opacity: Double = 1) 
    {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
