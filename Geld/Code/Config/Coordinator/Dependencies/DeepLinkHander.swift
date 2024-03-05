//
//  DeepLinkHander.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 04/03/24.
//

import Foundation
import SwiftUICoordinator

class DeepLinkHandler: DeepLinkHandling
{
    static let shared = DeepLinkHandler()
    
    let scheme = "coordinatorexample"
    let links: Set<DeepLink> = [
        DeepLink(action: "custom", route: HomeRoute.dashboard)
    ]
    
    private init() {}
}
