//
//  ViewController.swift
//  Proyecto
//
//  Created by Mac15 on 18/01/21.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
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
class ViewController: UIViewController {

    private var email = ""
    var pokes = ["Charmander", "Totodile", "Treecko", "Chimchar", "Snivy", "Froakie"]
    let longitud = 10
    var offset = 0
    var pokeActual: String?
    var pokemonManager = PokemonManager()
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var imagenOficial: UIImageView!
    @IBOutlet weak var nombrePokemon: UILabel!
    @IBOutlet weak var listaPokemon: UITableView!
    /*init(email: String){
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verPoke" {
            let PokeObj = segue.destination as! VerPokeViewController
            PokeObj.recibirNombre = pokeActual
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if email != ""{
            title = email
        }
        listaPokemon.dataSource = self
        listaPokemon.delegate = self
        pokemonManager.delegado = self
        listaPokemon.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        pokemonManager.fetchPoke(offset: offset, longitud: longitud)
    }

    @IBAction func buscarPokemonButton(_ sender: UIButton) {
        print(buscarTextField.text!)
        pokemonManager.fetchPoke(nombrePoke: buscarTextField.text!)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        offset = offset + longitud
        pokemonManager.fetchPoke(offset: offset, longitud: longitud)
    }
    
    @IBAction func previousButton(_ sender: UIButton) {
        if offset > 0{
            offset = offset - longitud
            pokemonManager.fetchPoke(offset: offset, longitud: longitud)
        }
    }
}
extension ViewController : PokemonManagerDelegate {
    func huboError(cualError: Error) {
        DispatchQueue.main.async {
            if cualError.localizedDescription == "The data couldn’t be read because it is missing."{
                
            }
            print(cualError.localizedDescription)
        }
    }
    
    func actualizaPokemon(poke: PokemonModelo) {
        DispatchQueue.main.async {
            self.nombrePokemon.text = poke.name
            let linkImg = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(poke.id).png"
            let imgpoke = URL(string: linkImg)
            self.imagenOficial.load(url: imgpoke!)
        }
    }
    func actualizaLista(lista: [String]){
        DispatchQueue.main.async {
            self.pokes = lista
            self.listaPokemon.reloadData()
        }
    }
    
}
extension ViewController : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        buscarTextField.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(buscarTextField.text!)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarTextField.text != ""{
            return true
        }else{
            buscarTextField.placeholder = "Escribe un pokemon"
            print("Por favor escibe algo ...")
            return false
        }
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokes.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = listaPokemon.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        let numeroPoke = offset + indexPath.row + 1
        let linkImg = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(numeroPoke).png"
        let imgpoke = URL(string: linkImg)
        celda.spritePoke.load(url: imgpoke!)
        celda.pokemonLabel.text = pokes[indexPath.row] + " #\(numeroPoke)"
        return celda
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokeActual = pokes[indexPath.row]
        print(pokeActual!)
        performSegue(withIdentifier: "verPoke", sender: nil)
    }
    
}

