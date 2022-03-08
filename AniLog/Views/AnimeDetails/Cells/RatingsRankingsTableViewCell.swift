//
//  RatingsRankingsTableViewCell.swift
//  AniLog
//
//  Created by USER on 29/12/2021.
//

import UIKit

class RatingsRankingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var ratingsLabel: UILabel!
    
    @IBOutlet weak var secondaryLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var rankings: [AnilistQuery.Data.Medium.Ranking?]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension RatingsRankingsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rankings?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rankingsCollectionViewCell", for: indexPath) as! RankingsCollectionViewCell
        
        var text = ""
        if let ranking = rankings?[indexPath.row]?.rank {
            text += "#\(ranking)"
        } else {
            text += ""
        }
        if let context = rankings?[indexPath.row]?.context {
            text += " \(context.capitalized)"
        } else {
            text += ""
        }
        if let season = rankings?[indexPath.row]?.season?.rawValue {
            text += " \(season.capitalized)"
        } else {
            text += ""
        }
        if let year = rankings?[indexPath.row]?.year {
            text += " \(year)"
        } else {
            text += ""
        }
        
        if rankings?[indexPath.row]?.type.rawValue == "POPULAR" {
            cell.rankingsImage.image = UIImage(named: "heart")
        } else if rankings?[indexPath.row]?.type.rawValue == "RATED" {
            cell.rankingsImage.image = UIImage(named: "star")
        }
        
        cell.rankingsLabel.text = text.condenseWhitespace()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.height) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
