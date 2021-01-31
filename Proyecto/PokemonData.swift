//
//  PokemonData.swift
//  Proyecto
//
//  Created by Mac15 on 19/01/21.
//

import Foundation
struct PokemonData: Codable{
    let sprites: Sprites
    let name: String
    let id: Int
    let height: Int
    let weight: Int
    let types: [Types]
    let stats: [Stats]
}

struct Sprites: Codable{
    let front_default: String
}

struct Types: Codable {
    let type: Type
}

struct Type: Codable {
    let name: String
}

struct Stats: Codable {
    let base_stat: Int
}

