//
//  VerPokeViewController.swift
//  Proyecto
//
//  Created by Mac15 on 29/01/21.
//

import UIKit
extension UIImageView {
    func loadImg(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
class VerPokeViewController: UIViewController {

    var pokemonManager = PokemonManager()
    @IBOutlet weak var pesoPoke: UILabel!
    @IBOutlet weak var alturaPoke: UILabel!
    @IBOutlet weak var imagenPoke: UIImageView!
    @IBOutlet weak var vida: UILabel!
    @IBOutlet weak var ataque: UILabel!
    @IBOutlet weak var defensa: UILabel!
    @IBOutlet weak var ataqueEspecial: UILabel!
    @IBOutlet weak var defensaEspecial: UILabel!
    @IBOutlet weak var velocidad: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var imagenTipo2: UIImageView!
    @IBOutlet weak var imagenTipo: UIImageView!
    @IBOutlet weak var numero: UILabel!
    var recibirNombre : String?
    @IBOutlet weak var nombrePoke: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonManager.delegado = self
        nombrePoke.text = recibirNombre
        pokemonManager.fetchPoke(nombrePoke: nombrePoke.text!)
    }
    

}
extension VerPokeViewController : PokemonManagerDelegate {
    func huboError(cualError: Error) {
        DispatchQueue.main.async {
            if cualError.localizedDescription == "The data couldn’t be read because it is missing."{
                
            }
            print(cualError.localizedDescription)
        }
    }
    
    func actualizaPokemon(poke: PokemonModelo) {
        DispatchQueue.main.async {
            self.alturaPoke.text = "Altura: \(poke.height)"
            self.pesoPoke.text = "Peso: \(poke.weight)"
            let linkImg = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(poke.id).png"
            let imgpoke = URL(string: linkImg)
            self.imagenPoke.load(url: imgpoke!)
            var complemento = ""
            if poke.id < 100{
                complemento = "0"
                if poke.id < 10{
                    complemento = "00"
                }
            }
            self.numero.text = "N.º\(complemento)\(poke.id)"
            self.vida.text = "PS: \(poke.hp)"
            self.ataque.text = "Ataque: \(poke.attack)"
            self.defensa.text = "Defensa: \(poke.defense)"
            self.ataqueEspecial.text = "Ataque Especial: \(poke.specialAttack)"
            self.defensaEspecial.text = "Defensa Especial: \(poke.specialDefense)"
            self.velocidad.text = "Velocidad: \(poke.speed)"
            self.imagenTipo.image = UIImage(named: poke.imagenTipo)
            self.imagenTipo2.image = UIImage(named: poke.imagenTipo2)
        }
    }
    func actualizaLista(lista: [String]){
        DispatchQueue.main.async {

        }
    }
    
}
