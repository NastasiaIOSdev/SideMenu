//
//  SideMenuCell.swift
//  SideMenu
//
//  Created by Анастасия Ларина on 11.08.2021.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    // MARK: - Properties
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    // MARK: - Outlets
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Background
        self.backgroundColor = .clear
        
       //  Icon
        self.iconImageView.tintColor = .white
        
        // Title
        self.titleLabel.textColor = .white
    }
}
