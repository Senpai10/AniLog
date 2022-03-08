//
//  CharactersTableViewCell.swift
//  AniLog
//
//  Created by USER on 29/12/2021.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    @IBOutlet weak var noInformationsLabel: UILabel!
    
    var characters: [AnilistQuery.Data.Medium.Character.Edge?]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension CharactersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characters?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "charactersCollectionViewCell", for: indexPath) as! CharactersCollectionViewCell
        if let imageUrl = URL(string: self.characters?[indexPath.row]?.node?.image?.large ?? "") {
            cell.characterImage.load(url: imageUrl)
        }
        if let characterName = self.characters?[indexPath.row]?.node?.name?.full {
            cell.characterName.text = characterName
        } else {
            cell.characterName.text = ""
        }
        if let characterNativeName = self.characters?[indexPath.row]?.node?.name?.native {
            cell.characterNativeName.text = characterNativeName
        } else {
            cell.characterNativeName.text = ""
        }
        
        if let voiceActorName = self.characters?[indexPath.row]?.voiceActors?.first(where: {$0?.languageV2 == "Japanese"}) {
            cell.voiceActorName.text = voiceActorName?.name?.full
        } else {
            cell.voiceActorName.text = ""
        }
        if let voiceActorNativeName = self.characters?[indexPath.row]?.voiceActors?.first(where: {$0?.languageV2 == "Japanese"}) {
            cell.voiceActorNativeName.text = voiceActorNativeName?.name?.native
        } else {
            cell.voiceActorNativeName.text = ""
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 234)
    }
}
