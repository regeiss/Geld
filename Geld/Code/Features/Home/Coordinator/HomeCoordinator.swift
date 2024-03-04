//
//  HomeCoordinator.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 01/03/24.
//

import SwiftUI
import SwiftUICoordinator

class HomeCoordinator: Routing
{
    // MARK: - Internal properties
    
    weak var parent: Coordinator?
    var childCoordinators = [WeakCoordinator]()
    let navigationController: NavigationController
    let startRoute: HomeRoute
    let factory: CoordinatorFactory
    
    // MARK: - Initialization

    init(
        parent: Coordinator?,
        navigationController: NavigationController,
        startRoute: HomeRoute = .dashboard,
        factory: CoordinatorFactory
    ) {
        self.parent = parent
        self.navigationController = navigationController
        self.startRoute = startRoute
        self.factory = factory
    }
    
    func handle(_ action: CoordinatorAction)
    {
//        switch action {
//        case HomeAction.abastecimento:
//            let coordinator = factory.makeAbastecimentoCoordinator(parent: self)
//            try? coordinator.start()
//            
//        case HomeAction.servico:
//            let coordinator = factory.makeServicoCoordinator(parent: self)
//            try? coordinator.start()
//            
//        case HomeAction.relatorios:
//            let coordinator = factory.makeRelatorioCoordinator(parent: self)
//            try? coordinator.start()
//            
//        case HomeAction.cadastros:
//            let coordinator = factory.makeCadastroCoordinator(parent: self)
//            try? coordinator.start()
//            
//        case HomeAction.alertas:
//            let coordinator = factory.makeAlertaCoordinator(parent: self)
//            try? coordinator.start()
//            
//        case Action.done(_):
//            popToRoot()
//            childCoordinators.removeAll()
//        default:
//            parent?.handle(action)
//        }
    }
    
    func handle(_ deepLink: DeepLink, with params: [String: String])
    {
//        switch deepLink.route
//        {
//        case HomeRoute.abastecimento:
//            let coordinator = factory.makeAbastecimentoCoordinator(parent: self)
//            try? coordinator.start()
//        default:
//            break
//        }
    }
}

// MARK: - RouterViewFactory

extension HomeCoordinator: RouterViewFactory
{
    @ViewBuilder
    public func view(for route: HomeRoute) -> some View
    {
        switch route
        {
        case .menuPrincipal:
            MenuInicialScreen<MenuPrincipalCoordinator>()
        case .abastecimento:
            AbastecimentoListaScreen<AbastecimentoCoordinator>()
        case .dashboard:
            EmptyView()
        case .cadastros:
            CadastroListaScreen<CadastroCoordinator>()
        case .servico:
            ServicoListaScreen<ServicoCoordinator>()
        case .relatorios:
            RelatorioListaScreen<RelatorioCoordinator>()
        case .alertas:
            AlertaListaScreen<AlertaCoordinator>()
        }
    }
}
