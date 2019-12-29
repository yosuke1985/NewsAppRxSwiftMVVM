//
//  Service.swift
//  NewsAppRxSwiftMVVM
//
//  Created by 中山 陽介 on 2019/12/29.
//  Copyright © 2019 中山 陽介. All rights reserved.
//

import Foundation
import RxSwift

struct Resource<T> {
    var url: String
    
    init(url: String) {
        self.url = url
    }
}

// https://mobikul.com/rest-api-calling-using-rxswift/ を改修して作成した。
extension URLRequest {
        func load<T: Codable>(resource: Resource<T>) -> Observable<T> {
            return Observable<T>.create { observer in
                guard let url = URL(string: resource.url) else { return Disposables.create {} }
                
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data{
                        do {
                            let model: T = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(model)
                        } catch let error {
                            observer.onError(error)
                        }
                        observer.onCompleted()
                    }
                }
                task.resume()
                
                return Disposables.create {
                    task.cancel()
                }
            }
        }
}
