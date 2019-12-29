//
//  ArticleTableViewCell.swift
//  NewsAppRxSwiftMVVM
//
//  Created by 中山 陽介 on 2019/12/29.
//  Copyright © 2019 中山 陽介. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: String!
    @IBOutlet var descriptionLabel: String!
    @IBOutlet var thumnailImage: String!
    var urlPage: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
