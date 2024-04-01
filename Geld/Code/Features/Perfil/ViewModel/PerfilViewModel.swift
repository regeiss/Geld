//
//  PerfilViewModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/03/24.
//

import Foundation
import Combine
import Factory

class PerfilViewModel: ObservableObject
{
    @Injected(\.perfilRepository) private var perfilRepository: PerfilRepository
    @Published var perfis = [Perfil]()
    @Published var errorMessage: String?

    init()
    {
        perfilRepository
          .$perfis
          .assign(to: &$perfis)
      }

    func addPerfil(_ perfil: Perfil)
    {
        do
        {
            try perfilRepository.addPerfil(perfil)
        }
        catch
        {
            print(error)
            errorMessage = error.localizedDescription
        }
    }

    func update(_ perfil: Perfil)
     {
         do
         {
             try perfilRepository.update(perfil)
         }
         catch
         {
             print(error)
             errorMessage = error.localizedDescription
         }
     }

     func delete(_ perfil: Perfil)
     {
         perfilRepository.delete(perfil)
     }
}
