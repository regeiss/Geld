//
//  CategoriaRepository.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 26/03/24.
//

import Foundation
import Factory
import FirebaseFirestore
import FirebaseFirestoreSwift

public class CategoriaRepository: ObservableObject
{
    @Injected(\.firestore) var firestore
    @Published var categoria = [Categoria]()
    private var listenerRegistration: ListenerRegistration?

    init()
    {
        subscribe()
    }

    deinit
    {
        unsubscribe()
    }

    func subscribe()
    {
        if listenerRegistration == nil
        {
            let query = Firestore.firestore().collection(Categoria.collectionName)

            listenerRegistration = query
                .addSnapshotListener { [weak self] (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents
                    else
                    {
                        print("No documents")
                        return
                    }

                    print("Mapping \(documents.count) documents")
                    self?.categoria = documents.compactMap { queryDocumentSnapshot in
                        do
                        {
                            return try queryDocumentSnapshot.data(as: Categoria.self)
                        }
                        catch
                        {
                            print("Error while trying to map document \(queryDocumentSnapshot.documentID): \(error.localizedDescription)")
                            return nil
                        }
                    }
                }
        }
    }

    private func unsubscribe()
    {
        if listenerRegistration != nil
        {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }

    func addCategoria(_ categoria: Categoria) throws
    {
        try firestore
            .collection(Categoria.collectionName)
            .addDocument(from: categoria)

    }

    func update(_ categoria: Categoria) throws
    {
        guard let documentId = categoria.id
        else
        {
            fatalError("Categoria \(categoria.nome) has no document ID.")
        }

        try firestore
            .collection(Categoria.collectionName)
            .document(documentId)
            .setData(from: categoria, merge: true)
    }

    func delete(_ categoria: Categoria)
    {
        guard let documentId = categoria.id
        else
        {
            fatalError("Categoria \(categoria.nome) has no document ID.")
        }

        firestore
            .collection(Categoria.collectionName)
            .document(documentId)
            .delete()
    }
}
