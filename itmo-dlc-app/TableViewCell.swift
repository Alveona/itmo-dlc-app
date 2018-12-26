//
//  TabelViewCell.swift
//  itmo-dlc-app
//
//  Created by Pomavau on 26.12.2018.
//  Copyright © 2018 Andrei Vlasov. All rights reserved.
//

import Foundation

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var markLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        subjectLabel.alpha = highlighted ? 0.5 : 1.0
        markLabel.alpha = highlighted ? 0.5 : 1.0

    }
    
}
