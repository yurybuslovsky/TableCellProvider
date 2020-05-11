//
//  DetailsViewController.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 11.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

final class DetailsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private weak var detailsLabel: UILabel!
    
    // MARK: Private properties
    
    private var details: String!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

}

// MARK: - Private API

extension DetailsViewController {

    func setUpView() {
        detailsLabel.text = details
    }
    
}

// MARK: - Public API

extension DetailsViewController {

    func configureWith(details: String) {
        self.details = details
    }
    
}
