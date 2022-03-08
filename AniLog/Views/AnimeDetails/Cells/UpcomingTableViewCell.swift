//
//  UpcomingTableViewCell.swift
//  AniLog
//
//  Created by USER on 05/01/2022.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var upcomingEpisodes: [AnilistQuery.Data.Medium.AiringSchedule.Node?]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
}

extension UpcomingTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.upcomingEpisodes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionViewCell", for: indexPath) as! UpcomingCollectionViewCell
        cell.layer.cornerRadius = 5
        if let episode = self.upcomingEpisodes?[indexPath.row]?.episode {
            cell.episodeLabel.text = "Episode \(episode) airing in"
        } else {
            cell.episodeLabel.text = ""
        }
        if let timeUntilAiring = self.upcomingEpisodes?[indexPath.row]?.timeUntilAiring {
            cell.hoursMinutesReleaseLabel.text = timeUntilAiring.secondsToDaysHoursMinutes()
        } else {
            cell.hoursMinutesReleaseLabel.text = ""
        }
        if let airingAt = self.upcomingEpisodes?[indexPath.row]?.airingAt {
            cell.dayReleaseLabel.text = airingAt.timestampToFullDate()
        } else {
            cell.dayReleaseLabel.text = ""
        }
        return cell
    }
}
