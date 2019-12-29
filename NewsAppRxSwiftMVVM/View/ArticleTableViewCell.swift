//
//  ArticleTableViewCell.swift
//  NewsAppRxSwiftMVVM
//
//  Created by 中山 陽介 on 2019/12/29.
//  Copyright © 2019 中山 陽介. All rights reserved.
//

import UIKit
import RxCocoa

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var thumnailImage: UIImageView!
    var urlToImage: String?
    var urlPage: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(urlString: String){
        let url = URL(string: urlString)
        do {
            let data = try Data(contentsOf: url!)
            self.thumnailImage.image = UIImage(data: data)
         }catch let err {
            print("Error : \(err.localizedDescription)")
         }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
