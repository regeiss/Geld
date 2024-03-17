//
//  HomeScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 04/03/24.
//

import SwiftUI

struct HomeScreen: View
{
    var body: some View
    {
        VStack
        {
            TabView
            {
                ContaListaScreen()
                    .tabItem { Label("Contas", systemImage: "house")}
                
                Text("Transfer")
                    .tabItem
                { Label("Transfer", systemImage: "arrow.left.arrow.right")  }
                Text("Deposit")
                    .tabItem
                { Label("Deposit", systemImage: "square.and.arrow.down.on.square")  }
                Text("Bill Pay")
                    .badge(2)
                    .tabItem
                { Label("Bill Pay", systemImage: "wallet.pass")  }
                Text("Contas")
                    .tabItem
                { Label("Contas", systemImage: "house")  }
                Text("Contas")
                    .tabItem
                { Label("Contas", systemImage: "house")  }
            }
        }
    }
}
// moreNavigationController.navigationBar.topItem?.title = String.localizeStringForKey("More")
