//
//  InformationsTableViewCell.swift
//  AniLog
//
//  Created by USER on 29/12/2021.
//

import UIKit

class InformationsTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var airingStatusValue: UILabel!
    
    @IBOutlet weak var formatValue: UILabel!
    
    @IBOutlet weak var startDateValue: UILabel!
    
    @IBOutlet weak var endDateStackView: UIStackView!
    
    @IBOutlet weak var endDateValue: UILabel!
    
    @IBOutlet weak var episodeDurationValue: UILabel!
    
    @IBOutlet weak var popularityValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
