//
//  WatchNextTableViewController.swift
//  AniLog
//
//  Created by USER on 15/12/2021.
//

import Foundation
import UIKit

class WatchNextTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    private var animeSchedule = [[AnimeData]]()
    
    private var animeToday: Anime?
        
    private var animeSeason: Anime?
    
    private var animeTop: Anime?
    
    private var animeUpcoming: Anime?
        
    private let week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    
    private var weekIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.getAnimeSchedule()
        self.getAnimeToday()
        self.getAnimeSeason()
        self.getAnimeTop()
        self.getAnimeUpcoming()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "animeDetailsSegue" {
            let destinationVC = segue.destination as! AnimeDetailsViewController
            destinationVC.malId = sender as! Int
        }
        if segue.identifier == "scheduleSegue" {
            let destinationVC = segue.destination as! ScheduleViewController
            destinationVC.animeSchedule = self.animeSchedule
        }
    }
    
    private func getAnimeSchedule() {
        ServiceJikan.shared.getAnimeSchedule(day: self.week[self.weekIndex]) { result in
            switch result {
            case .success(let animes):
                self.animeSchedule.append(animes.data)
                self.weekIndex += 1
                if self.weekIndex < self.week.count {
                    self.getAnimeSchedule()
                } else {
                    let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! AnimeTableViewCell
                    cell.scheduleDownloaded = true
                }
                
            case .failure(let error):
                print("error \(self.week[self.weekIndex])")
                print(error)
            }
        }
    }
    
    private func getAnimeToday() {
        let dayName : String = {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_us")
            dateFormatter.calendar = .current
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: Date()).lowercased()
        }()
        ServiceJikan.shared.getAnimeSchedule(day: dayName) { result in
            switch result {
            case .success(let animes):
                DispatchQueue.main.async() {
                    self.animeToday = animes
                    let indexPath = IndexPath(item: 0, section: 0)
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getAnimeSeason() {
        ServiceJikan.shared.getAnimeSeason { result in
            switch result {
            case .success(let animes):
                DispatchQueue.main.async() {
                    self.animeSeason = animes
                    let indexPath = IndexPath(item: 1, section: 0)
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getAnimeUpcoming() {
        ServiceJikan.shared.getAnimeUpcoming { result in
            switch result {
            case .success(let animes):
                DispatchQueue.main.async() {
                    self.animeUpcoming = animes
                    let indexPath = IndexPath(item: 2, section: 0)
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getAnimeTop() {
        ServiceJikan.shared.getAnimeTop { result in
            switch result {
            case .success(let animes):
                DispatchQueue.main.async() {
                    self.animeTop = animes
                    let indexPath = IndexPath(item: 3, section: 0)
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension WatchNextTableViewController: CellDelegate {
    func showSchedule() {
        performSegue(withIdentifier: "scheduleSegue", sender: nil)
    }
    
    func cellTapped(malId: Int) {
        performSegue(withIdentifier: "animeDetailsSegue", sender: malId)
    }
}

extension WatchNextTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animeTableCell", for: indexPath) as! AnimeTableViewCell
        if indexPath.row > 0 {
            cell.collectionView.isPagingEnabled = false
            if indexPath.row == 1 {
                cell.headerLabel.text = "Seasonal Anime"
            } else if indexPath.row == 2 {
                cell.headerLabel.text = "Upcoming Anime"
            } else if indexPath.row == 3 {
                cell.headerLabel.text = "Top Anime"
            }
        } else {
            cell.headerLabel.text = "Today"
            cell.collectionView.isPagingEnabled = true
        }
        cell.animeToday = self.animeToday
        cell.animeSeason = self.animeSeason
        cell.animeTop = self.animeTop
        cell.animeUpcoming = self.animeUpcoming
        cell.position = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 255
    }
}
