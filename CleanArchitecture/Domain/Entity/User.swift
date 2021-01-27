//
//  User.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/14.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: String
    let key: String
}

extension User {
    init() {
        self.init(id: "", key: "")
    }
}
