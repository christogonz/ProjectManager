//
//  ProjectDetailView.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-17.
//

import SwiftUI

struct ProjectDetailView: View {
    var project: Project
    @ObservedObject var projectViewModel: ProjectViewModel
    
    var body: some View {
        VStack {
            Text(project.name)
                .font(.largeTitle)
                .padding()
            
            Text(project.discription)
            
            List {
                ForEach(project.stores) {store in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(store.name)
                                .font(.headline)
                            
                            Text(store.locations)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        if store.isCompleted {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                        } else {
                            Image(systemName: "circle")
                                .foregroundStyle(.red)
                        }
                    }
                    .onTapGesture {
                        projectViewModel.toggleStoreCompletion(for: store, in: project)
                    }
                }
                
            }
            
           
        }
    }
}

//#Preview {
//    
//    let exempleStore = [
//        Store(name: "Elgigaganten Barkarby", locations: "Stockholm"),
//        Store(name: "Elgigaganten Barkarby", locations: "Stockholm"),
//        Store(name: "Elgigaganten Barkarby", locations: "Stockholm"),
//    ]
//    
//    let exempleProject = Project(
//        name: "Visit Store",
//        discription: "Visit all stores in Stockholm in one week",
//        stores: exempleStore)
//    
//    let projectViewmodel = ProjectViewModel()
//    
//    ProjectDetailView(project: exempleProject, projectViewModel: projectViewmodel)
//        .preferredColorScheme(.dark)
//}
