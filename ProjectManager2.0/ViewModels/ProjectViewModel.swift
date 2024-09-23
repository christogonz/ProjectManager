//
//  ProjectViewModel.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-17.
//

import Foundation
import SwiftUI

class ProjectViewModel: ObservableObject {
    @Published var projects: [Project] = [] {
        didSet {
            saveProjects()
        }
    }
    
    init() {
        loadProjects()
    }
    
    //MARK: Create New Project
    func addProject(name: String, discription: String, stores: [Store]) {
        let newProject = Project(name: name, discription: discription, stores: stores)
        projects.append(newProject)
    }
    
    //MARK: Save Project
    func saveProjects() {
        if let encodedData = try? JSONEncoder().encode(projects) {
            UserDefaults.standard.set(encodedData, forKey: "projects")
        }
    }
    
    //MARK: Get all the projects
    func loadProjects() {
        if let savedData = UserDefaults.standard.data(forKey: "projects"),
           let decodedProjects = try? JSONDecoder().decode([Project].self, from: savedData) {
            projects = decodedProjects
        }
    }
    
    //MARK: Complete Toggle for projects
    func toggleStoreCompletion(for store: Store, in project: Project) {
        if let projectIndex = projects.firstIndex(where: { $0.id == project.id }),
           let storeIndex = projects[projectIndex].stores.firstIndex(where: { $0.id == store.id }) {
            projects[projectIndex].stores[storeIndex].isCompleted.toggle()
        }
    }
    
    //MARK: Project Status Color
    func projectStatusColor(for project: Project) -> Color {
        let completedStores = project.stores.filter { $0.isCompleted }.count
        let totalStores = project.stores.count
        
        if completedStores == totalStores && totalStores > 0 {
            return .green
        } else if completedStores > 0 {
            return .yellow
        } else {
            return .red
        }
    }
    
    // MARK: Detele Project
    func deleteProject(at indexSet: IndexSet) {
        projects.remove(atOffsets: indexSet)
    }
    
}
