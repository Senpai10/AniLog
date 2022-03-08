//
//  ScheduleViewController.swift
//  AniLog
//
//  Created by USER on 09/02/2022.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
    
    var animeSchedule: [[AnimeData]?]?
        
    private var currentAnime = [AnimeData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "animeDetailsSegue" {
            let destinationVC = segue.destination as! AnimeDetailsViewController
            destinationVC.malId = sender as! Int
        }
    }
}

extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.animeSchedule?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.animeSchedule?[section]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionHeadersPinToVisibleBounds = true
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "scheduleCollectionReusableView", for: indexPath) as! ScheduleCollectionReusableView
            if indexPath.section == 0 {
                headerView.headerLabel.text = "Monday"
            } else if indexPath.section == 1 {
                headerView.headerLabel.text = "Tuesday"
            } else if indexPath.section == 2 {
                headerView.headerLabel.text = "Wednesday"
            } else if indexPath.section == 3 {
                headerView.headerLabel.text = "Thursday"
            } else if indexPath.section == 4 {
                headerView.headerLabel.text = "Friday"
            } else if indexPath.section == 5 {
                headerView.headerLabel.text = "Saturday"
            } else if indexPath.section == 6 {
                headerView.headerLabel.text = "Sunday"
            }
                     return headerView
                 }
                 return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCollectionViewCell", for: indexPath) as! ScheduleCollectionViewCell
        cell.layer.cornerRadius = 5
        if let imageUrl = URL(string: self.animeSchedule?[indexPath.section]?[indexPath.row].images["jpg"]?.imageURL ?? "") {
            cell.animeImageView.load(url: imageUrl)
        }
        cell.animeTitleLabel.text = self.animeSchedule?[indexPath.section]?[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "animeDetailsSegue", sender: self.animeSchedule?[indexPath.section]?[indexPath.row].malID)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad {
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (self.collectionView.frame.size.width - space) / 2.0
            return CGSize(width: size, height: 150)
        } else {
            return CGSize(width: self.collectionView.frame.size.width, height: 100)
        }
    }
}
