//
//  AllStoresView.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-16.
//

import SwiftUI

struct AllStoresView: View {
    @StateObject var storeViewModel = StoreViewModel()
    
    @State private var isAddingStore = false
    @State private var newStoreName = ""
    @State private var newStoreLocation = ""
    @State private var selectedChain = "Elgiganten"
    
    let storeChains = ["Elgiganten", "Telia", "Tele2", "Telenor", "Tre"]
    
    var body: some View {
        NavigationView {
            VStack {
                //MARK: TabBar
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(storeChains, id: \.self) { chain in
                            Text(chain)
                                .padding()
                                .background(chain == selectedChain ? Color.blue : .gray.opacity(0.2))
                                .clipShape(.rect(cornerRadius: 8))
                                .foregroundStyle(chain == selectedChain ? .white : .gray
                                )
                                .onTapGesture {
                                    selectedChain = chain
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
                
                // MARK: Store List
                if storeViewModel.stores.isEmpty {
                    VStack {
                        Image(systemName: "storefront.circle")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                            .padding()
                        
                        Text("Tap the plus button to add new stores!")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(storeViewModel.stores.filter { $0.chain == selectedChain }) {store in
                            VStack(alignment: .leading) {
                                Text(store.name)
                                    .font(.headline)
                                Text(store.locations)
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .onDelete(perform: storeViewModel.deleteStore(at:))
                    }
                    
                }
                Spacer()
            }
            .navigationTitle("All Stores")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isAddingStore = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $isAddingStore, content: {
//                VStack {
                    
                    CreateStoreSheetView(
                        newStoreName: $newStoreName,
                        newStoreLocation: $newStoreLocation,
                        selectedChain: $selectedChain
                    ) {
                      if !newStoreName.isEmpty && !newStoreLocation.isEmpty {
                          storeViewModel.addStore(
                            name: newStoreName,
                            Location: newStoreLocation,
                            chain: selectedChain
                          )
                          newStoreName = ""
                          newStoreLocation = ""
                          isAddingStore = false
                        }
                    }
                .padding()
            })
            
        }
    }
}

#Preview {
    AllStoresView()
        .preferredColorScheme(.dark)
}
