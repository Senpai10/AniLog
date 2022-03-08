//
//  RelatedTableViewCell.swift
//  AniLog
//
//  Created by USER on 30/12/2021.
//

import UIKit

class RelatedTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
    
    var delegate: CellDelegate?
    
    var related: [AnilistQuery.Data.Medium.Relation.Edge?]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension RelatedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return related?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "relatedCollectionViewCell", for: indexPath) as! RelatedCollectionViewCell
        if let imageUrl = URL(string: self.related?[indexPath.row]?.node?.coverImage?.extraLarge ?? "") {
            cell.imageView.load(url: imageUrl)
        }
        cell.titleLabel.text = self.related?[indexPath.row]?.node?.title?.romaji
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let idMal = self.related?[indexPath.row]?.node?.idMal {
            delegate?.cellTapped(malId: idMal)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 200)
    }
}

