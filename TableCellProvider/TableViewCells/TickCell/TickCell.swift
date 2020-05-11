//
//  TickCell.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

final class TickCell: UITableViewCell, Dequeueable {

    // MARK: Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tickImageView: UIImageView!
    
    // MARK: Private properties
    
    private var dataSource: TickCellDataSource!
    private unowned var delegate: TickCellDelegate!

}

// MARK: - Public API

extension TickCell {
    
    func configureWith(dataSource: TickCellDataSource, delegate: TickCellDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        titleLabel.text = dataSource.title
        tickImageView.alpha = dataSource.isTicked ? 1 : 0
    }

}
