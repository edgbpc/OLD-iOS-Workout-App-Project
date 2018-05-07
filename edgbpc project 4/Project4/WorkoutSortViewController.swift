//
//  WorkoutSortViewController.swift
//  Project4
//
//  Created by Eric Goodwin on 7/21/17.
//  Copyright © 2017 umsl. All rights reserved.
//

import Foundation

import UIKit

// Declaring our own delegate to let the main WorkoutViewController know which sort option we selected
protocol WorkoutSortDelegate: class {
    func sortDateMethodChanged(ascending: Bool)
    func sortDurationMethodChanged(ascending: Bool)
    func sortCaloriesMethodChanged(ascending: Bool)
}

class WorkoutSortViewController: UIViewController {
    
    weak var delegate: WorkoutSortDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }	
    
    @IBAction func sortDateAscendingButtonTapped(_ sender: Any) {

        delegate?.sortDateMethodChanged(ascending: true)
        let _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func sortDateDescendingButtonTapped(_ sender: UIButton) {

        delegate?.sortDateMethodChanged(ascending: false)
        let _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func sortCaloriesDescendingButtonTapped(_ sender: UIButton) {
        delegate?.sortCaloriesMethodChanged(ascending: false)
        let _ = navigationController?.popViewController(animated: true)
        }
    
    @IBAction func sortDurationDescendingButtonTapped(_ sender: UIButton) {
        delegate?.sortDurationMethodChanged(ascending: false)
        let _ = navigationController?.popViewController(animated: true)
        
    }
    

}
