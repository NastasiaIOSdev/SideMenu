//
//  SideMenuViewController.swift
//  SideMenu
//
//  Created by Анастасия Ларина on 11.08.2021.
//

import UIKit


protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: SideMenuViewControllerDelegate?
    var defaultHighlightedCell: Int = 0
    var menu: [SideMenuModel] = [
        SideMenuModel(icon: UIImage(systemName: "house")!, title: "Cats"),
        SideMenuModel(icon: UIImage(systemName: "star")!, title: "Star"),
        SideMenuModel(icon: UIImage(systemName: "building.columns")!, title: "AllBreeds"),
        SideMenuModel(icon: UIImage(systemName: "cloud.drizzle")!, title: "Weather"),
        SideMenuModel(icon: UIImage(systemName: "newspaper")!, title: "News")
    ]
    
    // MARK: - Outlets
    
    @IBOutlet var sideMenuTableView: UITableView!
    
    // MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        self.sideMenuTableView.separatorStyle = .none
        
        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        
        // Register TableView Cell
        self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)
        
        // Update TableView with the data
        self.sideMenuTableView.reloadData()
    }
  }
