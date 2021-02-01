//
//  EquipoViewController.swift
//  Proyecto
//
//  Created by Mac12 on 01/02/21.
//

import UIKit

class EquipoViewController: UIViewController {

    @IBOutlet weak var pokemon1: UIImageView!
    @IBOutlet weak var pokemon2: UIImageView!
    @IBOutlet weak var pokemon3: UIImageView!
    @IBOutlet weak var pokemon4: UIImageView!
    @IBOutlet weak var pokemon5: UIImageView!
    @IBOutlet weak var pokemon6: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let linkImg = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
        let im1 = "\(linkImg)\(UserDefaults.standard.string(forKey: "Pokemon")!).png"
        let im2 = "\(linkImg)\(UserDefaults.standard.string(forKey: "Pokemon2")!).png"
        let im3 = "\(linkImg)\(UserDefaults.standard.string(forKey: "Pokemon3")!).png"
        let im4 = "\(linkImg)\(UserDefaults.standard.string(forKey: "Pokemon4")!).png"
        let im5 = "\(linkImg)\(UserDefaults.standard.string(forKey: "Pokemon5")!).png"
        let im6 = "\(linkImg)\(UserDefaults.standard.string(forKey: "Pokemon6")!).png"
        let imgpoke = URL(string: im1)
        let imgpoke2 = URL(string: im2)
        let imgpoke3 = URL(string: im3)
        let imgpoke4 = URL(string: im4)
        let imgpoke5 = URL(string: im5)
        let imgpoke6 = URL(string: im6)
        self.pokemon1.load(url: imgpoke!)
        self.pokemon2.load(url: imgpoke2!)
        self.pokemon3.load(url: imgpoke3!)
        self.pokemon4.load(url: imgpoke4!)
        self.pokemon5.load(url: imgpoke5!)
        self.pokemon6.load(url: imgpoke6!)
    }

}
