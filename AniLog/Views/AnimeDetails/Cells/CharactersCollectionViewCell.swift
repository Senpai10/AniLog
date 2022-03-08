//
//  CharactersCollectionViewCell.swift
//  AniLog
//
//  Created by USER on 29/12/2021.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView! {
        didSet {
            characterImage.layer.borderWidth = 1.0
            characterImage.layer.masksToBounds = false
            characterImage.layer.borderColor = UIColor.white.cgColor
            characterImage.layer.cornerRadius = characterImage.frame.size.width / 2
            characterImage.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var characterName: UILabel!
    
    @IBOutlet weak var characterNativeName: UILabel!
    
    @IBOutlet weak var voiceActorName: UILabel!
    
    @IBOutlet weak var voiceActorNativeName: UILabel!
}
