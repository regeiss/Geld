//
//  PerfilRepository+Injection.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/03/24.
//

import Foundation
import Factory

extension Container
{
    public var perfilRepository: Factory<PerfilRepository>
    {
        Factory(self)
        {
            PerfilRepository()
        }
        .singleton
    }
}
