//
//  SearchCollectionReusableView.swift
//  AniLog
//
//  Created by USER on 18/01/2022.
//

import UIKit

protocol SearchDelegate {
    func showFiltersMenu()
}

class SearchCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var filtersButton: UIButton!
    
    var delegate: SearchDelegate?
    
    @IBAction func didTapFiltersButton(_ sender: Any) {
        self.delegate?.showFiltersMenu()
    }
}
