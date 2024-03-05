//
//  CoordinatorFactory.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 04/03/24.
//

import SwiftUI
import SwiftUICoordinator


@MainActor
protocol CoordinatorFactory
{
    func makeHomeCoordinator(parent: Coordinator) -> HomeCoordinator
//    func makeAbastecimentoCoordinator(parent: Coordinator) -> AbastecimentoCoordinator
//    func makeServicoCoordinator(parent: Coordinator) -> ServicoCoordinator
//    func makeRelatorioCoordinator(parent: Coordinator) -> RelatorioCoordinator
//    func makeCadastroCoordinator(parent: Coordinator) -> CadastroCoordinator
//    func makeAlertaCoordinator(parent: Coordinator) -> AlertaCoordinator
}
