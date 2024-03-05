//
//  HomeRoute.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 01/03/24.
//

import Foundation
import SwiftUICoordinator

enum HomeRoute: NavigationRoute
{
    case banco
    case carteira
    case conta
    case cartao
    case dashboard
    case despesas
    case home
    case perfil
    
    var title: String?
    {
        switch self
        {
        case .dashboard:
            return "Geld"
        default:
            return nil
        }
    }
    
    var action: TransitionAction?
    {
        switch self
        {
        case .banco:
            // We have to pass nil for the route presenting a child coordinator.
            return nil
        default:
            return .push(animated: true)
        }
    }
}
