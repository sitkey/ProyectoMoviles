//
//  PokemonListaData.swift
//  Proyecto
//
//  Created by Mac15 on 28/01/21.
//

import Foundation
struct PokemonListaData: Codable{
    let results: [Results]
}

struct Results: Codable{
    let name: String
}
