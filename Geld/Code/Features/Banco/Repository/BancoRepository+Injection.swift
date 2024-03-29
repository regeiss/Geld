//
//  BancoRepository+Injection.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 18/03/24.
//

import Foundation
import Factory

extension Container
{
    public var bancoRepository: Factory<BancoRepository>
    {
        Factory(self)
        {
            BancoRepository()
        }
        .singleton
    }
}
