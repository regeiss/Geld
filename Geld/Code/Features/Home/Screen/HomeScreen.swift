//
//  HomeScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 25/03/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct HomeScreen: View
{
    var body: some View 
    {
        VStack
        {
            OrcamentoCarrouselScreen()
            TransacaoHomeListaView()
        }.background(Color("backGroundColor"))
    }
}
