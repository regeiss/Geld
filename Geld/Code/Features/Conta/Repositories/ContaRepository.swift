//
//  ContaRepository.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 10/03/24.
//

import Foundation
import Factory
import FirebaseFirestore
import FirebaseFirestoreSwift

public class ContaRepository: ObservableObject
{
    @Injected(\.firestore) var firestore
    @Published var contas = [ContaModel]()
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
            let query = firestore.collection("conta")
            listenerRegistration = query.addSnapshotListener { [weak self] (querySnapshot, error) in
                guard let documents = querySnapshot?.documents
                else
                {
                    print("No documents")
                    return
                }
                
                print("Mapping \(documents.count) documents")
                self?.contas = documents.compactMap { queryDocumentSnapshot in
                    do {
                        return try queryDocumentSnapshot.data(as: ContaModel.self)
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
    
    func addConta(_ conta: ContaModel) throws
    {
        try firestore
            .collection(ContaModel.collectionName)
            .addDocument(from: conta)
    }
    
    func update(_ conta: ContaModel) throws
    {
        guard let documentId = conta.id
        else
        {
            fatalError("ContaModel \(conta.nome) has no document ID.")
        }
        
        try firestore
            .collection(ContaModel.collectionName)
            .document(documentId)
            .setData(from: conta, merge: true)
    }
    
    func delete(_ conta: ContaModel)
    {
        guard let documentId = conta.id
        else
        {
            fatalError("Reminder \(conta.nome) has no document ID.")
        }
        
        firestore
            .collection(ContaModel.collectionName)
            .document(documentId)
            .delete()
    }
}
