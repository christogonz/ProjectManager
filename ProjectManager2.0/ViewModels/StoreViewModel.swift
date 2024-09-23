//
//  StoreViewModel.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-16.
//

//didSet: Cada vez que el valor de stores cambia (por ejemplo, cuando agregas, eliminas o modificas una tienda en el array), el bloque dentro de didSet se ejecuta inmediatamente después de ese cambio.

import Foundation

class StoreViewModel: ObservableObject {
    @Published var stores: [Store] = [] {
        didSet {
            saveStores()
        }
    }
    
    init() {
        loadStores()
    }
    
    //MARK: Add Store
    func addStore(name: String, Location: String, chain: String) {
        let newStore = Store(name: name, locations: Location, chain: chain)
        stores.append(newStore)
    }
    
    //MARK: Detele Store
    func deleteStore(at indexSet: IndexSet) {
        stores.remove(atOffsets: indexSet)
    }
    
    //MARK: Save Stores
    private func saveStores() {
        if let encoded = try? JSONEncoder().encode(stores) {
            UserDefaults.standard.set(encoded, forKey: "stores")
        }
    }
    
    // MARK: LoadStores
    private func loadStores() {
        if let savedData = UserDefaults.standard.data(forKey: "stores"),
           let decoded = try? JSONDecoder().decode([Store].self, from: savedData) {
            stores = decoded
        }
    }
}
