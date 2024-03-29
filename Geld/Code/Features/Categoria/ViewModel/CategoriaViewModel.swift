//
//  CategoriaViewModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 27/03/24.
//

import Foundation
import Combine
import Factory

class CategoriaViewModel: ObservableObject
{
    @Published var categoria = [Categoria]()
    @Published var errorMessage: String?
    @Injected(\.categoriaRepository)

    private var categoriaRepository: CategoriaRepository

    init()
    {
        categoriaRepository
            .$categoria
            .assign(to: &$categoria)
    }

    func addCategoria(_ categoria: Categoria)
    {
        do
        {
            try categoriaRepository.addCategoria(categoria)
            errorMessage = nil
        }
        catch
        {
            print(error)
            errorMessage = error.localizedDescription
        }
    }

    func update(_ categoria: Categoria)
    {
        do
        {
            try categoriaRepository.update(categoria)
        }
        catch
        {
            print(error)
            errorMessage = error.localizedDescription
        }
    }

    func delete(_ categoria: Categoria)
    {
        categoriaRepository.delete(categoria)
    }
}
