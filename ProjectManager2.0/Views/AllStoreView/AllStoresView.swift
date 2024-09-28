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
            ZStack {
                AnimatedBgColor()
                    .ignoresSafeArea()

            
                VStack {
                    //MARK: TabBar
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(storeChains, id: \.self) { chain in
                                
                                CustomButton2(
                                    title: chain,
                                    backgroundColor: chain == selectedChain ? Color.blue.opacity(0.1) : Color("Card Background"),
                                    titleColor: chain == selectedChain ? Color.white : Color.gray
                                    
                                    )
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.4)) {
                                            selectedChain = chain
                                        }

                                    }
                            }
                        }
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    }
                    Spacer()
                    
                    // MARK: Store List
                    ScrollView {
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
                            
                                ForEach(storeViewModel.stores.filter { $0.chain == selectedChain }) {store in
                                    
                                        CardStoreList(
                                            name: store.name,
                                            location: store.locations,
                                            onRemove: {
                                                storeViewModel.deleteStore(store)
                                            }
                                        )
                                        .padding(.vertical, 20)
                                        .padding(.horizontal)
                                    
                                        
                                }
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
                            CustomIconButton()
                        })
                    }
                }
                .sheet(isPresented: $isAddingStore, content: {
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
                })
            }
            
        }
    }
}

#Preview {
    AllStoresView()
        .preferredColorScheme(.dark)
}
