//
//  WatchNextTableViewCell.swift
//  AniLog
//
//  Created by USER on 15/12/2021.
//

import UIKit

class AnimeTableViewCell: UITableViewCell {

    @IBOutlet weak var scheduleActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var headerLabel: UILabel!
        
    @IBOutlet weak var secondaryLabel: UILabel!
    
    @IBOutlet weak var scheduleButton: UIButton!
    
    var delegate: CellDelegate?
    
    var animeToday: Anime? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var animeSeason: Anime? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var animeUpcoming: Anime? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var animeTop: Anime? {
        didSet {
            self.collectionView.reloadData()
        }
    }

    var scheduleDownloaded = false {
        didSet {
            self.updateScheduleButton()
        }
    }

    var position = 0

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateScheduleButton() {
        // Anime Schedule loaded -> Show the button
        if self.scheduleDownloaded && (!self.scheduleActivityIndicator.isHidden && self.scheduleButton.isHidden) {
            self.scheduleActivityIndicator.isHidden = true
            self.scheduleButton.isHidden = false
        }
    }
    
    @IBAction func didTapShowSchedule(_ sender: Any) {
        if !self.scheduleDownloaded {
            // Anime Schedule is loading -> Show the activity indicator
            self.scheduleActivityIndicator.isHidden = false
            self.scheduleButton.isHidden = true
        } else {
            // Anime Schedule loaded -> Change the page if button is pressed
            self.delegate?.showSchedule()
        }
    }
}

extension AnimeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if position == 0 {
            return animeToday?.data.count ?? 0
        } else if position == 1 {
            return self.animeSeason?.data.count ?? 0
        } else if position == 2 {
            return self.animeUpcoming?.data.count ?? 0
        } else {
            return self.animeTop?.data.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if position == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animeWithSynopsisCollectionCell", for: indexPath) as! AnimeWithSynopsisCollectionViewCell
            let anime = animeToday?.data[indexPath.row]
            if let imageUrl = URL(string: anime?.images["jpg"]?.imageURL ?? "") {
                cell.animeImage.load(url: imageUrl)
            }
            if self.scheduleActivityIndicator.isHidden {
                self.scheduleButton.isHidden = false
            }
            self.headerLabel.text = "Today"
            self.secondaryLabel.isHidden = true
            cell.animeTitle.text = anime?.title
            cell.animeSynopsis.text = anime?.synopsis
            activityIndicator.stopAnimating()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animeWithoutSynopsisCollectionCell", for: indexPath) as! AnimeWithoutSynopsisCollectionViewCell
            if position == 1 {
                let currentYear = Calendar.current.component(.year, from: Date())
                let anime = self.animeSeason?.data[indexPath.row]
                if let imageUrl = URL(string: anime?.images["jpg"]?.imageURL ?? "") {
                    cell.animeImage.load(url: imageUrl)
                }
                self.scheduleButton.isHidden = true
                self.headerLabel.text = "Seasonal Anime"
                self.secondaryLabel.isHidden = false
                self.secondaryLabel.text = "\(animeSeason?.data[indexPath.row].year ?? currentYear) \(animeSeason?.data[indexPath.row].season ?? "")"
                cell.animeTitle.text = anime?.title
            } else if position == 2 {
                let anime = self.animeUpcoming?.data[indexPath.row]
                if let imageUrl = URL(string: anime?.images["jpg"]?.imageURL ?? "") {
                    cell.animeImage.load(url: imageUrl)
                }
                self.scheduleButton.isHidden = true
                self.headerLabel.text = "Upcoming Anime"
                self.secondaryLabel.isHidden = true
                cell.animeTitle.text = anime?.title
            } else {
                let anime = self.animeTop?.data[indexPath.row]
                if let imageUrl = URL(string: anime?.images["jpg"]?.imageURL ?? "") {
                    cell.animeImage.load(url: imageUrl)
                }
                self.scheduleButton.isHidden = true
                self.headerLabel.text = "Top Anime"
                self.secondaryLabel.isHidden = true
                cell.animeTitle.text = anime?.title
            }
            activityIndicator.stopAnimating()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if position == 0 {
            delegate?.cellTapped(malId: self.animeToday?.data[indexPath.row].malID ?? 0)
        } else if position == 1 {
            delegate?.cellTapped(malId: self.animeSeason?.data[indexPath.row].malID ?? 0)
        } else if position == 2 {
            delegate?.cellTapped(malId: self.animeUpcoming?.data[indexPath.row].malID ?? 0)
        } else if position == 3 {
            delegate?.cellTapped(malId: self.animeTop?.data[indexPath.row].malID ?? 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if position == 0 {
            return CGSize(width: self.frame.size.width, height: collectionView.frame.size.height)
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animeWithoutSynopsisCollectionCell", for: indexPath) as! AnimeWithoutSynopsisCollectionViewCell
            return CGSize(width: cell.animeImage.frame.width, height: collectionView.frame.size.height - 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if position == 0 {
            return 0
        } else {
            return 15
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if position == 0 {
            return 0
        } else {
            return 15
        }
    }
}
