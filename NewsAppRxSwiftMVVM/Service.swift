//
//  Service.swift
//  NewsAppRxSwiftMVVM
//
//  Created by 中山 陽介 on 2019/12/29.
//  Copyright © 2019 中山 陽介. All rights reserved.
//

import Foundation
import RxSwift

struct Resource<T: Codable> {
    let url: URL
}

extension URLRequest {
        static func load<T>(resource: Resource<T>) -> Observable<T> {
            return Observable.just(resource.url)
                .flatMap { url -> Observable<Data> in
                    let request = URLRequest(url: url)
                    return URLSession.shared.rx.data(request: request)
                }.map { data -> T in
                    return try JSONDecoder().decode(T.self, from: data)
            }
        }
}
