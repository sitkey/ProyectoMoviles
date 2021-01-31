//
//  PokemonTableViewCell.swift
//  Proyecto
//
//  Created by Mac15 on 20/01/21.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var spritePoke: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
