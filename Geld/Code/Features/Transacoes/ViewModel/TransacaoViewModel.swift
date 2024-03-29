//
//  TransacaoViewModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 28/03/24.
//

import Foundation
import Combine
import Factory

class TransacaoViewModel: ObservableObject
{
    @Injected(\.transacaoRepository) private var transacaoRepository: TransacaoRepository
    @Published var transacoes = [Transacao]()
    @Published var errorMessage: String?

    init()
    {
        transacaoRepository
          .$transacoes
          .assign(to: &$transacoes)
      }

    func addTransacao(_ transacao: Transacao)
    {
        do
        {
            try transacaoRepository.addTransacao(transacao)
        }
        catch
        {
            print(error)
            errorMessage = error.localizedDescription
        }
    }

    func update(_ transacao: Transacao)
     {
         do
         {
             try transacaoRepository.update(transacao)
         }
         catch
         {
             print(error)
             errorMessage = error.localizedDescription
         }
     }

     func delete(_ transacao: Transacao)
     {
         transacaoRepository.delete(transacao)
     }
}
