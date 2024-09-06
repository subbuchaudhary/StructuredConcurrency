//
//  CommentsViewModel.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/6/24.
//

import Foundation

struct CommentsViewModel {
    private let comments: [Comments]

    let pageTitle: String = "Comments"
    
    var commentViewModels: [CommentViewModel] {
        var cellModels: [CommentViewModel] = []
        comments.forEach {
            let model = CommentViewModel(commentId: $0.id, name: $0.name, email: $0.email, comment: $0.body)
            cellModels.append(model)
        }
        return cellModels
    }

    init(comments: [Comments]) {
        self.comments = comments
    }
}

#if DEBUG
extension CommentsViewModel {
    static let mock: CommentsViewModel = CommentsViewModel(comments: [Comments.mock])
}
#endif
