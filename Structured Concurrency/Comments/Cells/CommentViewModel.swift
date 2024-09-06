//
//  CommentViewModel.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/6/24.
//

import Foundation

struct CommentViewModel: Identifiable, Hashable {
    var id: UUID = UUID()

    let commentId: Int
    let name: String
    let email: String
    let comment: String

    init(commentId: Int, name: String, email: String, comment: String) {
        self.commentId = commentId
        self.name = name
        self.email = email
        self.comment = comment
    }
}

#if DEBUG
extension CommentViewModel {
    static let mock: CommentViewModel = CommentViewModel(commentId: 123,
                                                         name: "Name",
                                                         email: "email@gm.com",
                                                         comment: "body")
}
#endif
