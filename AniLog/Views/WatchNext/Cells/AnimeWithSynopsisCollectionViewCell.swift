//
//  WatchNextCollectionViewCell.swift
//  AniLog
//
//  Created by USER on 15/12/2021.
//

import UIKit

class AnimeWithSynopsisCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animeImage: UIImageView!
        
    @IBOutlet weak var animeTitle: UILabel!
    
    @IBOutlet weak var animeSynopsis: UITextView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        animeImage.layer.cornerRadius = 5
    }
}
