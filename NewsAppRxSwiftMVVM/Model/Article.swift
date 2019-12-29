//
//  Article.swift
//  NewsAppRxSwiftMVVM
//
//  Created by 中山 陽介 on 2019/12/29.
//  Copyright © 2019 中山 陽介. All rights reserved.
//

import Foundation

struct Article: Codable {
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
}
