//
//  DisclosureCell.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 11.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

final class DisclosureCell: UITableViewCell, Dequeueable {

    // MARK: Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Private properties
    
    private var dataSource: DisclosureCellDataSource!
    private unowned var delegate: DisclosureCellDelegate!
    
}

// MARK: - Actions

extension DisclosureCell {
    
    @IBAction private func disclosureButtonTapped(_ sender: UIButton) {
        delegate.disclosureButtonWasTapped(details: dataSource.details)
    }

}

// MARK: - Public API

extension DisclosureCell {
    
    func configureWith(dataSource: DisclosureCellDataSource, delegate: DisclosureCellDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        titleLabel.text = dataSource.title
    }
    
}
