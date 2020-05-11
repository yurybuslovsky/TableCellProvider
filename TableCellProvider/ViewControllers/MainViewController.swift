//
//  ViewController.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Type Aliases

typealias TableCellDelegate = TickCellDelegate & DisclosureCellDelegate

// MARK: - Declaration

final class MainViewController: UIViewController, TableCellDelegate {

    // MARK: Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Private properties
    
    private var cellProviders: [AnyTableCellProvider] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: Public properties
    
    var details: String!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let destination = segue.destination as? DetailsViewController {
            destination.configureWith(details: details)
        }
    }

}

// MARK: - Private API

extension MainViewController {
 
    func setUpTableView() {
        let tickCellProvider1 = AnyTableCellProvider(TickCellProvider(
            dataSource: .init(title: "Tick 1", isTicked: false),
            delegate: self,
            tableView: tableView
        ))

        let tickCellProvider2 = AnyTableCellProvider(TickCellProvider(
            dataSource: .init(title: "Tick 2", isTicked: true),
            delegate: self,
            tableView: tableView
        ))
        
        let tickCellProvider3 = AnyTableCellProvider(TickCellProvider(
            dataSource: .init(title: "Tick 3", isTicked: false),
            delegate: self,
            tableView: tableView
        ))
        
        let disclosureCellProvider1 = AnyTableCellProvider(DisclosureCellProvider(
            dataSource: .init(title: "Title 1", details: "Details 1"),
            delegate: self,
            tableView: tableView
        ))
        
        let disclosureCellProvider2 = AnyTableCellProvider(DisclosureCellProvider(
            dataSource: .init(title: "Title 2", details: "Details 2"),
            delegate: self,
            tableView: tableView
        ))
        
        cellProviders = [
            tickCellProvider1,
            disclosureCellProvider1,
            tickCellProvider2,
            tickCellProvider3,
            disclosureCellProvider2,
        ]
    }
    
}

// MARK: - Table View Data Source

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { cellProviders.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellProviders[indexPath.row].cellForRow(at: indexPath)
    }

}

// MARK: - Table View Delegate

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellProviders[indexPath.row].didSelectRow()
    }

}
