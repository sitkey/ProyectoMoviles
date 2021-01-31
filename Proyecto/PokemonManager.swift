//
//  PokemonManager.swift
//  Proyecto
//
//  Created by Mac15 on 19/01/21.
//

import Foundation

protocol PokemonManagerDelegate {
    func actualizaPokemon(poke: PokemonModelo)
    func huboError(cualError: Error)
    func actualizaLista(lista: [String])
}

struct PokemonManager{
    
    var delegado: PokemonManagerDelegate?
    let pokeURL = "https://pokeapi.co/api/v2/pokemon/"
    var varios = true
    mutating func fetchPoke(offset: Int, longitud: Int){
        self.varios = true
        let urlString = "\(pokeURL)?offset=\(offset)&limit=\(longitud)"
        realizarSolicitud(urlString: urlString)
    }
    mutating func fetchPoke(nombrePoke: String){
        self.varios = false
        let urlString = "\(pokeURL)\(nombrePoke)"
        print(urlString)
        realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud(urlString: String){
        //Crear url
        if let url = URL(string: urlString){
            //Crear obj URLSession
            let session = URLSession(configuration: .default)
            //Asigna una tarea a las sesion
            let tarea = session.dataTask(with: url){(data, respuesta, error) in
                if error != nil{
                    self.delegado?.huboError(cualError: error!)
                    return
                }
                if varios.self == false{
                    if let datosSeguros = data{
                        if let poke = self.parseJSON(pokeData: datosSeguros){
                            self.delegado?.actualizaPokemon(poke: poke)
                        }
                    }
                }else{
                    if let datosSeguros = data{
                        if let poke = self.parseJSON(lista: datosSeguros){
                            self.delegado?.actualizaLista(lista: poke)
                        }
                    }
                }
                
            }
            //Empezar tarea
            tarea.resume()
        }
    }
    
    func parseJSON(lista: Data) -> [String]?{
        let decoder = JSONDecoder()
        do{
            let dataDecodificada = try decoder.decode(PokemonListaData.self, from: lista)
            let cantidad = dataDecodificada.results.count
            var results: [String] = []
            for i in 1...cantidad{
                results.append(dataDecodificada.results[i-1].name)
            }
            return results
        }catch{
            delegado?.huboError(cualError: error)
            return nil
        }
        
        
    }
    
    func parseJSON(pokeData: Data) -> PokemonModelo? {
        let decoder = JSONDecoder()
        
        do{
            let dataDecodificada = try decoder.decode(PokemonData.self, from: pokeData)
           
            let nombre = dataDecodificada.name
            let sprite = dataDecodificada.sprites.front_default
            let id = dataDecodificada.id
            let height = dataDecodificada.height
            let weight = dataDecodificada.weight
            let hp = dataDecodificada.stats[0].base_stat
            let attack = dataDecodificada.stats[1].base_stat
            let defense = dataDecodificada.stats[2].base_stat
            let specialAttack = dataDecodificada.stats[3].base_stat
            let specialDefense = dataDecodificada.stats[4].base_stat
            let speed = dataDecodificada.stats[5].base_stat
            let type = dataDecodificada.types[0].type.name
            var secondaryType = ""
            if dataDecodificada.types.count == 2{
                secondaryType = dataDecodificada.types[1].type.name
            }
            let ObjPoke = PokemonModelo(front_default: sprite, name: nombre, id: id, height: height, weight: weight, attack: attack, specialAttack: specialAttack, defense: defense, hp: hp, speed: speed, specialDefense: specialDefense, type: type, secondaryType: secondaryType)
            return ObjPoke
            
        }catch{
            delegado?.huboError(cualError: error)
            return nil
        }
    }
    
}
