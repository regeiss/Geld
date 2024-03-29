//
//  CategoriaListaScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 27/03/24.
//

import SwiftUI

struct CategoriaListaScreen: View 
{
    @StateObject private var viewModel = CategoriaViewModel()
    @State private var isAddDialogPresented = false
    @State private var editableCategoria: Categoria?

    // MARK: - Body
    var body: some View
    {
        NavigationStack
        {
            List($viewModel.categoria) { $categoria in
                CategoriaDetalheView(categoria: $categoria)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true)
                {
                    Button(role: .destructive, action: { viewModel.delete(categoria)})
                    {
                        Image(systemName: "trash")
                    }
                }
                .onTapGesture
                {
                    editableCategoria = categoria
                }
            }
            .navigationTitle("Categoria")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing)
                {
                    Button(action: presentAddView)
                    {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddDialogPresented)
            {
                CategoriaAddEditView { categoria in
                    viewModel.addCategoria(categoria)
                }
            }
            .sheet(item: $editableCategoria) { categoria in
                CategoriaAddEditView(categoria: categoria, mode: .edit) { categoria in
                    viewModel.update(categoria)
                }
            }
            .tint(.blue)
        }
    }
    // MARK: - Funcs
    private func presentAddView()
    {
        isAddDialogPresented.toggle()
    }
}
