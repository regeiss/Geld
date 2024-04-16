//
//  HomeScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 25/03/24.
//

import SwiftUI

struct HomeScreen: View
{
    var body: some View 
    {
        VStack
        {
            OrcamentoScreen()
            TransacaoHomeListaView()
        }.background(Color("backGroundColor"))
    }
}
