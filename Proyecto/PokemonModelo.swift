//
//  PokemonModelo.swift
//  Proyecto
//
//  Created by Mac15 on 19/01/21.
//

import Foundation

struct PokemonModelo {
    let front_default: String
    let name: String
    let id: Int
    let height: Int
    let weight: Int
    let attack: Int
    let specialAttack: Int
    let defense: Int
    let hp: Int
    let speed: Int
    let specialDefense: Int
    let type: String
    let secondaryType: String
    
    var imagenTipo: String{
            switch type {
            case "grass":
                return "Tipo_planta"
            case "fire":
                return "Tipo_fuego"
            case "water":
                return "Tipo_agua"
            case "flying":
                return "Tipo_volador"
            case "normal":
                return "Tipo_normal"
            case "ice":
                return "Tipo_hielo"
            case "dark":
                return "Tipo_siniestro"
            case "dragon":
                return "Tipo_dragon"
            case "fighting":
                return "Tipo_lucha"
            case "psychic":
                return "Tipo_psiquico"
            case "steel":
                return "Tipo_acero"
            case "fairy":
                return "Tipo_hada"
            case "poison":
                return "Tipo_veneno"
            case "bug":
                return "Tipo_bicho"
            case "ground":
                return "Tipo_tierra"
            case "electric":
                return "Tipo_electrico"
            case "ghost":
                return "Tipo_fantasma"
            case "rock":
                return "Tipo_roca"
            default:
                return ""
            }
        }
    var imagenTipo2: String{
            switch secondaryType {
            case "grass":
                return "Tipo_planta"
            case "fire":
                return "Tipo_fuego"
            case "water":
                return "Tipo_agua"
            case "flying":
                return "Tipo_volador"
            case "normal":
                return "Tipo_normal"
            case "ice":
                return "Tipo_hielo"
            case "dark":
                return "Tipo_siniestro"
            case "dragon":
                return "Tipo_dragon"
            case "fighting":
                return "Tipo_lucha"
            case "psychic":
                return "Tipo_psiquico"
            case "steel":
                return "Tipo_acero"
            case "fairy":
                return "Tipo_hada"
            case "poison":
                return "Tipo_veneno"
            case "bug":
                return "Tipo_bicho"
            case "ground":
                return "Tipo_tierra"
            case "electric":
                return "Tipo_electrico"
            case "ghost":
                return "Tipo_fantasma"
            case "rock":
                return "Tipo_roca"
            default:
                return ""
            }
        }
}
