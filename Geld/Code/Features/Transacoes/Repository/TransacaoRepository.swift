//
//  TransacaoRepository.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 28/03/24.
//

import Foundation
import Factory

extension Container
{
    public var transacaoRepository: Factory<TransacaoRepository>
    {
        Factory(self)
        {
            TransacaoRepository()
        }
        .singleton
    }
}
