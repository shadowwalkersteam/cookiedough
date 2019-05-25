//
//  NotificationHandler.swift
//  CookieDough
//
//  Created by Zohaib on 5/23/19.
//  Copyright © 2019 Zohaib. All rights reserved.
//

import Foundation

class NotificationHandler : Codable {
    
    var title: String
    var body: String
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
