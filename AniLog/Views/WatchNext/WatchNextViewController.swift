//
//  WatchNextViewController.swift
//  AniLog
//
//  Created by USER on 15/12/2021.
//

import Foundation
import UIKit
import PopupDialog

class WatchNextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton() {
        let containerAppearance = PopupDialogContainerView.appearance()
        containerAppearance.cornerRadius = 15
        let popup = PopupDialog(viewController: PreferencesViewController())
        self.present(popup, animated: true, completion: nil)
    }

}
