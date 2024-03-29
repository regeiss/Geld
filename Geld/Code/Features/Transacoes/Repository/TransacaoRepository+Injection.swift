//
//  TransacaoRepository+Injection.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 28/03/24.
//

import Foundation
import Factory
import FirebaseFirestore
import FirebaseFirestoreSwift

public class TransacaoRepository: ObservableObject
{
    @Injected(\.firestore) var firestore
    @Published var transacoes = [Transacao]()
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
            let query = Firestore.firestore().collection(Transacao.collectionName)

            listenerRegistration = query
                .addSnapshotListener { [weak self] (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents
                    else
                    {
                        print("No documents")
                        return
                    }

                    print("Mapping \(documents.count) documents")
                    self?.transacoes = documents.compactMap { queryDocumentSnapshot in
                        do
                        {
                            return try queryDocumentSnapshot.data(as: Transacao.self)
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

    func addTransacao(_ transacao: Transacao) throws
    {
        try firestore
            .collection(Transacao.collectionName)
            .addDocument(from: transacao)

    }

    func update(_ transacao: Transacao) throws
    {
        guard let documentId = transacao.id
        else
        {
            fatalError("Transacao \(transacao.nome) has no document ID.")
        }

        try firestore
            .collection(Transacao.collectionName)
            .document(documentId)
            .setData(from: transacao, merge: true)
    }

    func delete(_ transacao: Transacao)
    {
        guard let documentId = transacao.id
        else
        {
            fatalError("Transacao \(transacao.nome) has no document ID.")
        }

        firestore
            .collection(Transacao.collectionName)
            .document(documentId)
            .delete()
    }
}
