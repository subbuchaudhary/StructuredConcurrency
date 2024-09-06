//
//  Comments.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/5/24.
//

import Foundation

struct Comments: Identifiable, Codable, Hashable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}

#if DEBUG
extension Comments {
    static let mock: Comments = Comments(postId: 2,
                                         id: 123,
                                         name: "Name",
                                         email: "email@gm.com",
                                         body: "body")
}
#endif
