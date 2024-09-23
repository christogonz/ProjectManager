//
//  ProjectModel.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-17.
//

import Foundation

struct Project: Identifiable, Codable {
    var id = UUID()
    var name: String
    var discription: String
    var stores: [Store]
}
