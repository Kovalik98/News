//
//  Safari.swift
//  News
//
//  Created by Kovalyk Nazar on 5/10/19.
//  Copyright © 2019 Kovalyk Nazar. All rights reserved.
//

import UIKit
import SafariServices

class Safari {
    
    static func safariViewController(url: URL) -> UIViewController {
        
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        
        return safariViewController
    }
}
