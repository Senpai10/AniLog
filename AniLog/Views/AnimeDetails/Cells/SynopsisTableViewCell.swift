//
//  SynopsisTableViewCell.swift
//  AniLog
//
//  Created by USER on 28/12/2021.
//

import UIKit

class SynopsisTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var expandCollapseButton: UIButton!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var indexPath = IndexPath()
    
    var delegate: AnimeDetailsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func expandCollapseTapped(_ sender: Any) {
        delegate?.expandCollapseLabel(indexPath: indexPath)
    }
}
