//
//  ContaRepository+Injection.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 16/03/24.
//

import Foundation
import Factory

extension Container
{
    public var contaRepository: Factory<ContaRepository>
    {
        Factory(self)
        {
            ContaRepository()
        }
        .singleton
    }
}
