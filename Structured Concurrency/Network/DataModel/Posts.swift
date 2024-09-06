//
//  Posts.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/5/24.
//

import Foundation

struct Posts: Identifiable, Codable, Hashable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

#if DEBUG
extension Posts {
    static let mock: Posts = Posts(userId: 1,
                                   id: 123,
                                   title: "Title",
                                   body: "Body")
}
#endif
