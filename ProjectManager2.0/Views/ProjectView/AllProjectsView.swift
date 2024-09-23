//
//  AllProjectsView.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-16.
//

import SwiftUI

struct AllProjectsView: View {
    @StateObject var projectViewModel = ProjectViewModel()
    @StateObject var storeViewModel = StoreViewModel()
    
    @State private var isAddingProject: Bool = false
    @State private var newProjectName = ""
    @State private var newProjectDiscription = ""
    @State private var selectedStores: [Store] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if projectViewModel.projects.isEmpty {
                    VStack {
                        Image(systemName: "folder.badge.plus")
                            .resizable()
                            .frame(width: 80, height: 65)
                            .foregroundStyle(.gray)
                            .padding()
                        
                        Text("Tap the plus button to add create a new project.")
                            .font(.headline)
                            .foregroundStyle(.gray)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(projectViewModel.projects) { project in
                            NavigationLink(destination: ProjectDetailView(project: project, projectViewModel: projectViewModel)) {
                                
                                HStack {
                                    Circle()
                                        .fill(projectViewModel.projectStatusColor(for: project))
                                        .frame(width: 10, height: 10)
                                        .padding(.trailing, 10)
                                    VStack(alignment: .leading) {
                                        Text(project.name)
                                            .font(.headline)
                                        Text(project.discription)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    
                                }
                            }
                        }
                        .onDelete(perform: projectViewModel.deleteProject(at:))
                    }
                }
            }
            .navigationTitle("All Projects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddingProject.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $isAddingProject) {
                CreateProjectSheetView(newProjectName: $newProjectName, newProjectDescription: $newProjectDiscription, selectedStore: $selectedStores, storeViewModel: storeViewModel) {
                    
                    if !newProjectName.isEmpty {
                        projectViewModel.addProject(name: newProjectName, discription: newProjectDiscription, stores: selectedStores)
                        newProjectName = ""
                        newProjectDiscription = ""
                        selectedStores = []
                        isAddingProject = false
                    }
                }
            }
        }
    }
    
}

#Preview {
       AllProjectsView()
        .preferredColorScheme(.dark)
}
