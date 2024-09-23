//
//  StoreModel.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-16.
//

import Foundation

struct Store: Identifiable, Codable {
    var id = UUID()
    var name: String
    var locations: String
    var chain: String
    var isCompleted: Bool = false
}
