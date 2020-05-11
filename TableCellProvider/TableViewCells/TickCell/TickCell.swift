//
//  TickCell.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

final class TickCell<Delegate: TickCellDelegate>: BaseTableCell<TickCellDataSource, Delegate> {

    // MARK: Private properties

    private let titleLabel: UILabel = .init()
    private let tickImageView: UIImageView = .init()
    
    // MARK: Overridden API
    
    override func setUp() {
        titleLabel.text = dataSource.title
        tickImageView.alpha = dataSource.isTicked ? 1 : 0
    }
    
    override func setUpUI() {
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(tickImageView)
        let margin = contentView.layoutMarginsGuide

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tickImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tickImageView.heightAnchor.constraint(equalToConstant: 14),
            tickImageView.widthAnchor.constraint(equalToConstant: 17),
            tickImageView.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 10),
            
            titleLabel.leadingAnchor.constraint(equalTo: tickImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: margin.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: 10),
            
            tickImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        ])
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.numberOfLines = 1
        
        tickImageView.image = UIImage(named: "checkmark")
        tickImageView.contentMode = .scaleAspectFit
    }

}
