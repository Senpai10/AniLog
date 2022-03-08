//
//  AnimeWithoutSynopsisCollectionViewCell.swift
//  AniLog
//
//  Created by USER on 21/12/2021.
//

import UIKit

class AnimeWithoutSynopsisCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animeImage: UIImageView!
    
    @IBOutlet weak var animeTitle: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        animeImage.layer.cornerRadius = 5
    }
}
