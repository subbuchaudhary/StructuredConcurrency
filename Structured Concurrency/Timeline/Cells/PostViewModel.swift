//
//  PostViewModel.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/5/24.
//

import Foundation

struct PostViewModel: Identifiable, Hashable {
    let id: UUID = UUID()
    
    let postId: Int
    let postTitle: String
    let postBody: String
    var comments: [Comments]
    private let commentsCount: Int

    var commentsText: String {
        "Total \(commentsCount) people commented on this post"
    }

    init(postId: Int, postTitle: String, postBody: String, comments: [Comments]) {
        self.postId = postId
        self.postTitle = postTitle
        self.postBody = postBody
        self.comments = comments
        commentsCount = comments.count
    }
}

#if DEBUG
extension PostViewModel {
    static let mock: PostViewModel = PostViewModel(postId: Posts.mock.id,
                                                   postTitle: Posts.mock.title,
                                                   postBody: Posts.mock.body,
                                                   comments: [Comments.mock])
}
#endif
