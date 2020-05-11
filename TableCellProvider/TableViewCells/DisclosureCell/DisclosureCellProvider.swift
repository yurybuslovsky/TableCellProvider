//
//  DisclosureCellProvider.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 11.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Data Source

struct DisclosureCellDataSource {
    let title: String
    let details: String
}

// MARK: - Delegate

protocol DisclosureCellDelegate: class {
    func disclosureButtonWasTapped(details: String)
}

extension DisclosureCellDelegate where Self: MainViewController {

    func disclosureButtonWasTapped(details: String) {
        self.details = details
        performSegue(withIdentifier: .init(describing: DetailsViewController.self), sender: self)
    }

}

// MARK: - Provider

final class DisclosureCellProvider<Delegate: DisclosureCellDelegate>:
    BaseTableCellProvider
    <
        DisclosureCellDataSource,
        Delegate,
        DisclosureCell<Delegate>
    >
{}
