//
//  SearchCollectionViewController.swift
//  AniLog
//
//  Created by USER on 18/01/2022.
//

import UIKit
import PanModal
import Toast_Swift

class SearchCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var animeSearch: Anime? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.searchAnime(text: "")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "animeDetailsSegue" {
            let destinationVC = segue.destination as! AnimeDetailsViewController
            destinationVC.malId = sender as! Int
        }
    }
    
    private func searchAnime(text: String) {
        self.activityIndicator.startAnimating()
        ServiceJikan.shared.searchAnime(q: text) { result in
            switch result {
            case .success(let animes):
                DispatchQueue.main.async() {
                    self.animeSearch = animes
                    self.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension SearchCollectionViewController: FiltersDelegate {
    func applyFilters() {
        self.searchAnime(text: self.searchText)
    }
}

extension SearchCollectionViewController: SearchDelegate {
    func showFiltersMenu() {
        let filtersViewController = FiltersViewController() as FiltersViewController
        filtersViewController.delegate = self
        self.presentPanModal(filtersViewController)
    }
}

extension SearchCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "searchCollectionReusableView", for: indexPath) as! SearchCollectionReusableView
            headerView.delegate = self
                     return headerView
                 }
                 return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animeSearch?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        if let imageUrl = URL(string: self.animeSearch?.data[indexPath.row].images["jpg"]?.imageURL ?? "") {
            cell.imageView.load(url: imageUrl)
        }
        cell.titleLabel.text = self.animeSearch?.data[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "animeDetailsSegue", sender: self.animeSearch?.data[indexPath.row].malID)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width / 2 - 10, height: 300)
    }
}

extension SearchCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text?.count ?? 0 >= 3) {
            self.searchText = searchBar.text ?? ""
            self.searchAnime(text: searchBar.text ?? "")
        } else {
            self.view.makeToast("Need at least 3 characters", duration: 2.0, position: .top)
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
}
