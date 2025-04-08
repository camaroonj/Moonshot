//
//  Astronaut.swift
//  Moonshot
//
//  Created by Cameron Prestwich on 4/9/25.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
