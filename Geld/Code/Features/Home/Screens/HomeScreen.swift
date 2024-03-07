//
//  HomeScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 04/03/24.
//

import SwiftUI
import SwiftUICoordinator

struct HomeScreen<Coordinator: Routing>: View
{
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = ViewModel<Coordinator>()
    
    var body: some View
    {
        VStack
        {
            TabView
            {
                Text("Contas")
                    .tabItem
                { Label("Contas", systemImage: "house")  }
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
        .onAppear { viewModel.coordinator = coordinator }
    }
}

extension HomeScreen
{
    @MainActor class ViewModel<R: Routing>: ObservableObject
    {
        var coordinator: R?
        
        func didTapAdd()
        {
            coordinator?.handle(HomeAction.dashboard)
        }
    }
}
