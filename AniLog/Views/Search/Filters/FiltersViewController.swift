//
//  FiltersViewController.swift
//  AniLog
//
//  Created by USER on 03/03/2022.
//

import UIKit
import PanModal

protocol FiltersDelegate {
    func applyFilters()
}

class FiltersViewController: UIViewController {

    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var statusSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var ratingTextfield: UITextField!
    
    @IBOutlet weak var minScoreTextfield: UITextField!
    
    @IBOutlet weak var maxScoreTextfield: UITextField!
    
    private let ratings = ["", "G - All Ages", "PG - Children", "PG-13 - Teens 13 or older", "R - 17+ (violence & profanity)", "R+ - Mild Nudity", "Rx - Hentai"]
    
    private let score = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",]

    private let ratingPickerView = UIPickerView()
    
    private let minScorePickerView = UIPickerView()
    
    private let maxScorePickerView = UIPickerView()

    var delegate: FiltersDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.prepareRatingsView()
        self.prepareScoreView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var defaultRowIndex = self.ratings.firstIndex(of: ServiceJikan.searchOptions.ratingSelected) ?? 0
        self.ratingPickerView.selectRow(defaultRowIndex, inComponent: 0, animated: false)
        
        defaultRowIndex = self.score.firstIndex(of: ServiceJikan.searchOptions.minScore) ?? 0
        self.minScorePickerView.selectRow(defaultRowIndex, inComponent: 0, animated: false)

        defaultRowIndex = self.score.firstIndex(of: ServiceJikan.searchOptions.maxScore) ?? 0
        self.maxScorePickerView.selectRow(defaultRowIndex, inComponent: 0, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.applyFilters()
    }
    
    private func prepareRatingsView() {
        self.ratingPickerView.delegate = self
        self.ratingPickerView.dataSource = self
        
        self.ratingTextfield.text = ServiceJikan.searchOptions.ratingSelected
        self.ratingTextfield.inputView = self.ratingPickerView
    }
    
    private func prepareScoreView() {
        self.minScorePickerView.delegate = self
        self.minScorePickerView.dataSource = self
        
        self.minScoreTextfield.text = ServiceJikan.searchOptions.minScore
        self.minScoreTextfield.inputView = self.minScorePickerView
        
        self.maxScorePickerView.delegate = self
        self.maxScorePickerView.dataSource = self
        
        self.maxScoreTextfield.text = ServiceJikan.searchOptions.maxScore
        self.maxScoreTextfield.inputView = self.maxScorePickerView
    }
}

extension FiltersViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if self.ratingPickerView == pickerView {
            return self.ratings.count
        } else {
            return self.score.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if self.ratingPickerView == pickerView {
            return self.ratings[row]
        } else {
            return self.score[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.ratingPickerView == pickerView {
            self.ratingTextfield.text = self.ratings[row]
            self.ratingTextfield.resignFirstResponder()
            ServiceJikan.searchOptions.ratingSelected = self.ratings[row]
        } else if self.minScorePickerView == pickerView {
            self.minScoreTextfield.text = self.score[row]
            self.minScoreTextfield.resignFirstResponder()
            ServiceJikan.searchOptions.minScore = self.score[row]
        } else if self.maxScorePickerView == pickerView {
            self.maxScoreTextfield.text = self.score[row]
            self.maxScoreTextfield.resignFirstResponder()
            ServiceJikan.searchOptions.maxScore = self.score[row]
        }
    }
}

extension FiltersViewController: PanModalPresentable {

    var panScrollable: UIScrollView? {
        return nil
    }
}
