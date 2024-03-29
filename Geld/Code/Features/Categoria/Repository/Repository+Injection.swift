//
//  Repository+Injection.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 26/03/24.
//

import Foundation
import Factory

extension Container
{
    public var categoriaRepository: Factory<CategoriaRepository>
    {
        Factory(self)
        {
            CategoriaRepository()
        }
        .singleton
    }
}
