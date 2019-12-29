//
//  ArticleListViewModel.swift
//  NewsAppRxSwiftMVVM
//
//  Created by 中山 陽介 on 2019/12/29.
//  Copyright © 2019 中山 陽介. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    var articles: [ArticleViewModel]
    
    init(articles: [Article]) {
        self.articles = articles.compactMap(ArticleViewModel.init)
    }
}

struct ArticleViewModel {
    
    var article: Article

    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }

    var description: Observable<String> {
        return Observable<String>.just(article.description)

    }
    var url: Observable<String> {
        return Observable<String>.just(article.url)

    }
    var urlToImage: Observable<String> {
        return Observable<String>.just(article.urlToImage)
    }
}
