//
//  AttractionTableViewCell.swift
//  WhereToGo_Honam
//
//  Created by 권정근 on 6/25/24.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {
    
    static let identifier = "AttractionTableViewCell"
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
