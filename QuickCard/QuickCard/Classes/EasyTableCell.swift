//
//  EasyTableCell.swift
//  QuickCard
//
//  Created by  on 2023-04-19.
//

import Foundation
import UIKit

class EasyTableCell: UITableViewCell {
    
    //outlets
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
