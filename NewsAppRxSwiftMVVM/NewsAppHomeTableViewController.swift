//
//  NewsAppHomeTableViewController.swift
//  NewsAppRxSwiftMVVM
//
//  Created by 中山 陽介 on 2019/12/29.
//  Copyright © 2019 中山 陽介. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsAppHomeTableViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    var articleListViewModel: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.title = "Newsアプリ"
        self.fetchAPIAndSetVM()
    }
    
    private func fetchAPIAndSetVM(){
        
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=jp&apiKey=0cf790498275413a9247f8b94b3843fd")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { response in
                self.articleListViewModel = ArticleListViewModel(articles: response.articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

  

}
