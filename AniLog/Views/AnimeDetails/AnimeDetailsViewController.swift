//
//  AnimeDetailsViewController.swift
//  AniLog
//
//  Created by USER on 23/12/2021.
//

import UIKit
import Apollo

protocol AnimeDetailsCellDelegate {
    func expandCollapseLabel(indexPath: IndexPath)
}

class AnimeDetailsViewController: UIViewController {

    @IBOutlet weak var animeBannerImage: UIImageView!
    
    @IBOutlet weak var animeImage: UIImageView! {
        didSet {
            animeImage.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var animeTitle: UILabel! {
        didSet {
            self.animeTitle.text = ""
        }
    }
    
    @IBOutlet weak var animeAlternativeTitle: UILabel! {
        didSet {
            self.animeAlternativeTitle.text = ""
        }
    }
    
    @IBOutlet weak var viewEpisodeButton: UIButton! {
        didSet {
            viewEpisodeButton.layer.cornerRadius = 17
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    private var anime: GraphQLResult<AnilistQuery.Data>?
    
    var malId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getAnimeDetails()
    }
    
    private func getAnimeDetails() {
        ServiceAniList.shared.getAnimeDetails(idMal: malId) {
            result in
            switch result {
            case .success(let anime):
                self.anime = anime
                DispatchQueue.main.async() {
                    if let coverImageUrl = URL(string: anime.data?.media?.coverImage?.extraLarge ?? "") {
                        self.animeImage.load(url: coverImageUrl)
                    }
                    if let bannerImageUrl = URL(string: anime.data?.media?.bannerImage ?? "") {
                        self.animeBannerImage.load(url: bannerImageUrl)
                        self.animeBannerImage.alpha = 0.7
                    }
                    if let title = anime.data?.media?.title?.romaji {
                        self.animeTitle.text = title
                        self.animeTitle.adjustFontSizeToFit()
                    } else {
                        self.animeTitle.text = ""
                    }
                    var alternativestitles = ""
                    if let englishTitle = anime.data?.media?.title?.english {
                        alternativestitles += englishTitle
                    }
                    if let nativeTitle = anime.data?.media?.title?.native {
                        if alternativestitles.isEmpty {
                            alternativestitles += nativeTitle
                        } else {
                            alternativestitles += "; \(nativeTitle)"
                        }
                    }
                    self.animeAlternativeTitle.text = alternativestitles
                    
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension AnimeDetailsViewController: AnimeDetailsCellDelegate {
    func expandCollapseLabel(indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? SynopsisTableViewCell {
            let synopsisLabel = cell.synopsisLabel
            let expandCollapseButton = cell.expandCollapseButton
            self.tableView.beginUpdates()
            synopsisLabel?.numberOfLines = synopsisLabel?.numberOfLines == 0 ? 5 : 0
            expandCollapseButton?.setTitle(synopsisLabel?.numberOfLines == 0 ? "Collapse" : "Expand", for: .normal)
            self.tableView.endUpdates()
        }
    }
}


extension AnimeDetailsViewController: CellDelegate {
    func showSchedule() {
        return
    }
    
    func cellTapped(malId: Int) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnimeDetailsViewController") as! AnimeDetailsViewController
        vc.malId = malId
        self.show(vc, sender: nil)
    }
}

extension AnimeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            let upcomingEpisode = anime?.data?.media?.airingSchedule?.nodes?.filter { $0?.timeUntilAiring ?? -1 >= 0 }
            if upcomingEpisode?.count ?? 0 > 0 {
                return tableView.estimatedRowHeight
            } else {
                return 0.0
            }
        } else if indexPath.row == 5 {
            if let related = anime?.data?.media?.relations?.edges?.filter({ $0?.node?.type?.rawValue == "ANIME" }) {
                if related.count > 0 {
                    return tableView.estimatedRowHeight
                } else {
                    return 0.0
                }
            } else {
                return 0.0
            }
        } else {
            return tableView.estimatedRowHeight
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return prepareSynopsisCell(cellForRowAt: indexPath)
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "upcomingTableViewCell", for: indexPath) as! UpcomingTableViewCell
            cell.upcomingEpisodes = anime?.data?.media?.airingSchedule?.nodes?.filter { $0?.timeUntilAiring ?? -1 >= 0 }
            return cell
        } else if indexPath.row == 2 {
            return prepareRatingsRankingsCell(cellForRowAt: indexPath)
        } else if indexPath.row == 3 {
            return prepareCharactersCell(cellForRowAt: indexPath)
        } else if indexPath.row == 4 {
            return prepareInformationsCell(cellForRowAt: indexPath)
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "relatedTableViewCell", for: indexPath) as! RelatedTableViewCell
            cell.delegate = self
            cell.related = anime?.data?.media?.relations?.edges?.filter { $0?.node?.type?.rawValue == "ANIME" }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "synopsisTableViewCell", for: indexPath) as! SynopsisTableViewCell
            return cell
        }
    }
    
    private func prepareSynopsisCell(cellForRowAt indexPath: IndexPath) -> SynopsisTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "synopsisTableViewCell", for: indexPath) as! SynopsisTableViewCell
        if let synopsis = anime?.data?.media?.description {
            cell.synopsisLabel.text = synopsis
            cell.indexPath = indexPath
            cell.delegate = self
            cell.expandCollapseButton.isHidden = false
        } else {
            cell.synopsisLabel.text = ""
            cell.expandCollapseButton.isHidden = true
        }
        return cell
    }
    
    private func prepareCharactersCell(cellForRowAt indexPath: IndexPath) -> CharactersTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charactersTableViewCell", for: indexPath) as! CharactersTableViewCell
        if anime?.data?.media?.characters?.edges?.count ?? 0 > 0 {
            cell.characters = anime?.data?.media?.characters?.edges
            cell.noInformationsLabel.isHidden = true
        } else {
            cell.noInformationsLabel.isHidden = false
        }
        return cell
    }
    
    private func prepareRatingsRankingsCell(cellForRowAt indexPath: IndexPath) -> RatingsRankingsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ratingsRankingsTableViewCell", for: indexPath) as! RatingsRankingsTableViewCell
        if let rating = anime?.data?.media?.averageScore ?? anime?.data?.media?.meanScore {
            cell.ratingsLabel.text = "\(rating)"
            cell.ratingsLabel.adjustFontSizeToFit()
        } else {
            cell.ratingsLabel.text = "No Rating"
            cell.ratingsLabel.adjustFontSizeToFit()
        }
        cell.rankings = anime?.data?.media?.rankings
        return cell
    }
    
    private func prepareInformationsCell(cellForRowAt indexPath: IndexPath) -> InformationsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "informationsTableViewCell", for: indexPath) as! InformationsTableViewCell
        
        var airingStatusValue = ""
        if let airingSchedule =  anime?.data?.media?.airingSchedule?.nodes?.filter({ $0?.timeUntilAiring ?? -1 >= 0 }) {
            if airingSchedule.count > 0 {
                airingStatusValue = "Ongoing"
            } else {
                airingStatusValue = "Finished"
            }
        } else {
            airingStatusValue = "Unknown"
        }
        cell.airingStatusValue.text = airingStatusValue
        
        if let format = anime?.data?.media?.format?.rawValue {
            cell.formatValue.text = format
        } else {
            cell.formatValue.text = "Unknown"
        }
        
        var startDate = ""
        if let startDateDay = anime?.data?.media?.startDate?.day {
            startDate += "\(startDateDay)"
        }
        if let startDateMonthName = anime?.data?.media?.startDate?.month {
            startDate += " \(startDateMonthName.getMonthNameFromNumber())"
        }
        if let startDateYear = anime?.data?.media?.startDate?.year {
            startDate += " \(startDateYear)"
        }
        if startDate.isEmpty {
            cell.startDateValue.text = "Unknonw"
        } else {
            cell.startDateValue.text = startDate.condenseWhitespace()
        }
        
        let endDateDay = anime?.data?.media?.endDate?.day
        let endDateMonth = anime?.data?.media?.endDate?.month
        let endDateYear = anime?.data?.media?.endDate?.year
        if endDateDay == nil && endDateMonth == nil && endDateYear == nil {
            cell.endDateStackView.isHidden = true
        } else {
            cell.endDateStackView.isHidden = false
            var endDate = ""
            if let endDateDay = anime?.data?.media?.endDate?.day {
                endDate += "\(endDateDay)"
            }
            if let endDateMonthName = anime?.data?.media?.endDate?.month {
                endDate += " \(endDateMonthName.getMonthNameFromNumber())"
            }
            if let endDateYear = anime?.data?.media?.endDate?.year {
                endDate += " \(endDateYear)"
            }
            if endDate.isEmpty {
                cell.endDateValue.text = "Unknown"
            } else {
                cell.endDateValue.text = endDate.condenseWhitespace()
            }
        }
        
        if let duration = anime?.data?.media?.duration {
            cell.episodeDurationValue.text = "\(duration) Minutes"
        } else {
            cell.episodeDurationValue.text = "Unknown"
        }
        if let popularity = anime?.data?.media?.popularity {
            cell.popularityValue.text = "\(popularity)"
        } else {
            cell.popularityValue.text = "Unknown"
        }
        return cell
    }
    
}
