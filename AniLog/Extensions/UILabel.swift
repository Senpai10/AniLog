//
//  UILabel.swift
//  AniLog
//
//  Created by USER on 28/12/2021.
//

import Foundation
import UIKit

extension UILabel {
    func adjustFontSizeToFit() {
        let minimumFontSize: CGFloat = 5.0
        let maximumFontSize: CGFloat = 30.0
        for size in stride(from: maximumFontSize, to: minimumFontSize, by: -CGFloat(0.1)) {
            let proposedFont = font.withSize(size)
            let constraintSize = CGSize(width: bounds.size.width, height: CGFloat(MAXFLOAT))
            let labelSize = ((text ?? "") as NSString).boundingRect(with: constraintSize,
                                                                    options: .usesLineFragmentOrigin,
                                                                    attributes: [NSAttributedString.Key.font: proposedFont],
                                                                    context: nil)
            if labelSize.height <= bounds.size.height {
                font = proposedFont
                setNeedsLayout()
                break;
            }
        }
    }
}
