//
//  Pokemon.swift
//  Pokemon
//
//  Created by Maxim on 11.03.2023.
//

import Foundation

struct PokemonApp: Codable {
let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
   
}
