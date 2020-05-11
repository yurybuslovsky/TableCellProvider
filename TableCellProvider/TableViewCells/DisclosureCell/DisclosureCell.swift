//
//  DisclosureCell.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 11.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

final class DisclosureCell<Delegate: DisclosureCellDelegate>: BaseTableCell<DisclosureCellDataSource, Delegate> {

    // MARK: Private properties

    private let titleLabel: UILabel = .init()
    private let disclosureButton: UIButton = .init()
    
    // MARK: Overridden API
    
    override func setUp() {
        titleLabel.text = dataSource.title
    }
    
    override func setUpUI() {
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(disclosureButton)
        let margin = contentView.layoutMarginsGuide

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        disclosureButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: margin.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -10),
            
            disclosureButton.centerXAnchor.constraint(equalTo: margin.centerXAnchor),
            disclosureButton.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -10),
            
            titleLabel.bottomAnchor.constraint(equalTo: disclosureButton.topAnchor, constant: -10),
        ])
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        
        disclosureButton.setTitle("Show More...", for: .normal)
        disclosureButton.setTitleColor(.blue, for: .normal)
        disclosureButton.addTarget(self, action: #selector(disclosureButtonTapped(_:)), for: .touchUpInside)
    }

    // MARK: Actions

    @objc private func disclosureButtonTapped(_ sender: UIButton) {
        delegate.disclosureButtonWasTapped(details: dataSource.details)
    }

}
