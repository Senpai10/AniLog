//
//  PreferencesViewController.swift
//  AniLog
//
//  Created by USER on 15/02/2022.
//

import UIKit

class PreferencesViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!

    @IBOutlet weak var doneButton: UIButton!
        
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
        
    @IBOutlet weak var themeSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var themeSyncSystemSwitch: UISwitch!
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prepare Theme Synchronization with system Switch
        self.updateThemeSyncWithSystemSwitchUI()
        
        // Prepare SegmentControl
        self.updateThemeSegmentControlUI()
        
        // Prepare Navigation bar
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        self.navigationBar.topItem?.titleView = label
        self.showHideNavigationBar()
        
        // Do any additional setup after loading the view.
    }
    
    private func updateThemeSyncWithSystemSwitchUI() {
        if #available(iOS 13.0, *) {
            self.themeSyncSystemSwitch.alpha = 1.0
            self.themeSyncSystemSwitch.isEnabled = true
            if let themeSyncWithSystem = UserDefaultsHelper.getData(type: Bool.self, forKey: .themeSyncWithSystem) {
                self.themeSyncSystemSwitch.isOn = themeSyncWithSystem ? true : false
            }
        } else {
            self.themeSyncSystemSwitch.alpha = 0.5
            self.themeSyncSystemSwitch.isEnabled = false
            self.themeSyncSystemSwitch.isOn = false
        }
    }
    
    private func updateThemeSegmentControlUI() {
        if #available(iOS 13.0, *) {
            self.themeSegmentControl.alpha = 1.0
            self.themeSegmentControl.isEnabled = true
            if let theme = UserDefaultsHelper.getData(type: String.self, forKey: .theme) {
                self.themeSegmentControl.selectedSegmentIndex = theme == "light" ? 0 : 1
            }
            if let themeSyncWithSystem = UserDefaultsHelper.getData(type: Bool.self, forKey: .themeSyncWithSystem) {
                self.themeSegmentControl.alpha = themeSyncWithSystem ? 0.5 : 1.0
                self.themeSegmentControl.isEnabled = themeSyncWithSystem ? false : true
            }
        } else {
            self.themeSegmentControl.alpha = 0.5
            self.themeSegmentControl.isEnabled = false
            self.themeSegmentControl.selectedSegmentIndex = 0
        }
    }
    
    private func showHideNavigationBar() {
        if isVisible(view: self.titleLabel) {
            // Visible
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationBar.topItem?.titleView?.alpha = 0
                self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                self.navigationBar.shadowImage = UIImage()
                self.navigationBar.isTranslucent = true
                self.view.layoutIfNeeded()

            }, completion: nil)
        } else {
            // No visible
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationBar.topItem?.titleView?.alpha = 1
                self.navigationBar.setBackgroundImage(nil, for: .default)
                self.navigationBar.shadowImage = nil
                self.navigationBar.isTranslucent = false
                self.navigationBar.backgroundColor = nil
                self.view.layoutIfNeeded()

            }, completion: nil)
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didThemeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // Light
            UserDefaultsHelper.setData(value: "light", key: .theme)
        } else {
            // Dark
            UserDefaultsHelper.setData(value: "dark", key: .theme)
        }
        self.appDelegate.overrideApplicationThemeStyle()
    }
    
    @IBAction func didThemeSyncWithSystemChanged(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaultsHelper.setData(value: true, key: .themeSyncWithSystem)
     
            // Get OS Theme
            let theme = UITraitCollection.current.userInterfaceStyle
            if theme == .dark {
                UserDefaultsHelper.setData(value: "dark", key: .theme)
            } else {
                UserDefaultsHelper.setData(value: "light", key: .theme)
            }
            self.updateThemeSegmentControlUI()
            self.appDelegate.overrideApplicationThemeStyle()
        } else {
            UserDefaultsHelper.setData(value: false, key: .themeSyncWithSystem)
            self.updateThemeSegmentControlUI()
        }
        self.updateThemeSegmentControlUI()
    }
}

extension PreferencesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.showHideNavigationBar()
    }
    
    func isVisible(view: UIView) -> Bool {
        func isVisible(view: UIView, inView: UIView?) -> Bool {
            guard let inView = inView else { return true }
            let viewFrame = inView.convert(view.bounds, from: view)
            if viewFrame.intersects(inView.bounds) {
                return isVisible(view: view, inView: inView.superview)
            }
            return false
        }
        return isVisible(view: view, inView: view.superview)
    }
}
