//
//  Article.swift
//  News
//
//  Created by Kovalyk Nazar on 5/10/19.
//  Copyright © 2019 Kovalyk Nazar. All rights reserved.
//

import UIKit

//MARK: Article

struct Article: Codable {
    
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    var publishedAtDate: String?
    let url: URL?
    let stringUrlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url = "url"
        case stringUrlToImage = "urlToImage"
        case publishedAtDate = "publishedAt"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        source = try container.decodeIfPresent(Source.self, forKey: .source)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        publishedAtDate = try container.decodeIfPresent(String.self, forKey: .publishedAtDate)
        publishedAtDate = DateFormatService.dateFormatter(time: publishedAtDate!)
        url = try container.decodeIfPresent(URL.self, forKey: .url)
        stringUrlToImage = try container.decodeIfPresent(String.self, forKey: .stringUrlToImage)
    }
}

