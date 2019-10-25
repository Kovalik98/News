//
//  NewsResult.swift
//  News
//
//  Created by Kovalyk Nazar on 5/10/19.
//  Copyright © 2019 Kovalyk Nazar. All rights reserved.
//

import UIKit

//MARK: Result

struct NewsResult: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]
}

//MARK: Result

enum Result<T> {
    case success(result: T)
    case failure(error: Error)
}
