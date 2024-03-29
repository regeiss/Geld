//
//  ContaViewModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 10/03/24.
//

import Foundation
import Combine
import Factory

class ContaViewModel: ObservableObject
{
    @Injected(\.contaRepository) private var contaRepository: ContaRepository
    @Published var contas = [Conta]()
    @Published var errorMessage: String?
    
    init() 
    {
        contaRepository
          .$contas
          .assign(to: &$contas)
      }
    
    func addConta(_ conta: Conta)
    {
        do
        {
            try contaRepository.addConta(conta)
        }
        catch
        {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func update(_ conta: Conta)
     {
         do
         {
             try contaRepository.update(conta)
         }
         catch
         {
             print(error)
             errorMessage = error.localizedDescription
         }
     }
     
     func delete(_ conta: Conta)
     {
         contaRepository.delete(conta)
     }
}
