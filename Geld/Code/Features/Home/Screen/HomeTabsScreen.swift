//
//  HomeScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 04/03/24.
//

import SwiftUI

enum Tabs: String
{
    case home
    case account
    case transfer
    case deposit
}

struct HomeTabsScreen: View
{
    @State var selectedTab: Tabs = .home
    

    init()
    {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
    }

    var body: some View
    {
        VStack
        {
            TabView(selection: $selectedTab)
            {
                HomeScreen()
                    .tabItem { Label("Home", systemImage: "house")}
                    .tag(Tabs.home)
                
                Text("Transfer")
                    .tabItem
                { Label("Transfer", systemImage: "arrow.left.arrow.right")  }

                ContaListaScreen()
                    .tabItem { Label("Contas", systemImage: "house")}
                    .tag(Tabs.account)
                
                CategoriaListaScreen()
                    .tabItem { Label("Categorias", systemImage: "house")}
                    .tag(Tabs.account)
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
