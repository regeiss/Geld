//
//  PerfilRepository.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/03/24.
//

import Foundation
import Factory
import FirebaseFirestore
import FirebaseFirestoreSwift

public class PerfilRepository: ObservableObject
{
    @Injected(\.firestore) var firestore
    @Published var perfis = [Perfil]()
    private var listenerRegistration: ListenerRegistration?

    init()
    {
        subscribe()
    }

    deinit
    {
        unsubscribe()
    }

    // MARK: - Funcs
    func subscribe()
    {
        if listenerRegistration == nil
        {
            let query = firestore.collection("perfil")
            listenerRegistration = query.addSnapshotListener { [weak self] (querySnapshot, error) in
                guard let documents = querySnapshot?.documents
                else
                {
                    print("No documents")
                    return
                }

                print("Mapping \(documents.count) documents")
                self?.perfis = documents.compactMap { queryDocumentSnapshot in
                    do {
                        return try queryDocumentSnapshot.data(as: Perfil.self)
                    }
                    catch {
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

    func addPerfil(_ perfil: Perfil) throws
    {
        try firestore
            .collection(Perfil.collectionName)
            .addDocument(from: perfil)
    }

    func update(_ perfil: Perfil) throws
    {
        guard let documentId = perfil.id
        else
        {
            fatalError("PerfilModel \(perfil.nome) has no document ID.")
        }

        try firestore
            .collection(Perfil.collectionName)
            .document(documentId)
            .setData(from: perfil, merge: true)
    }

    func delete(_ perfil: Perfil)
    {
        guard let documentId = perfil.id
        else
        {
            fatalError("Perfil \(perfil.nome) has no document ID.")
        }

        firestore
            .collection(Perfil.collectionName)
            .document(documentId)
            .delete()
    }
}
