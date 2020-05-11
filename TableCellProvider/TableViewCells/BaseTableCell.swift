//
//  BaseTableCell.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

class BaseTableCell<DataSource, Delegate: AnyObject>: UITableViewCell {
    
    // MARK: Public properties
    
    final var dataSource: DataSource!
    final unowned var delegate: Delegate!
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Should-be-overridden API
    
    func setUp() {}
    func setUpUI() {}

}

// MARK: - Configurable Table Cell

extension BaseTableCell: ConfigurableTableCell {
    
    func configureWith(dataSource: DataSource, delegate: Delegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        setUp()
    }

}
