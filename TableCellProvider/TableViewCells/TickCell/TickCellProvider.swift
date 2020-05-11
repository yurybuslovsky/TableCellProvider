//
//  TickCellProvider.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Data Source

final class TickCellDataSource {
    let title: String
    var isTicked: Bool
    
    init(title: String, isTicked: Bool) {
        self.title = title
        self.isTicked = isTicked
    }
}

// MARK: - Delegate

protocol TickCellDelegate: class {
    func tickWasToggled(title: String, isTicked: Bool)
}

extension TickCellDelegate where Self: MainViewController {

    func tickWasToggled(title: String, isTicked: Bool) {
        let alert = UIAlertController(
            title: "Attention",
            message: "\(title) has been \(isTicked ? "ticked" : "unticked")",
            preferredStyle: .alert
        )
        
        let confirmAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }

}

// MARK: - Provider

final class TickCellProvider<Delegate: TickCellDelegate>:
    BaseTableCellProvider
    <
        TickCellDataSource,
        Delegate,
        TickCell
    >
{

    override func configure(cell: Cell) {
        cell.configureWith(dataSource: dataSource, delegate: delegate)
    }

    override func didSelectRow() {
        dataSource.isTicked.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        delegate.tickWasToggled(title: dataSource.title, isTicked: dataSource.isTicked)
    }
    
}
