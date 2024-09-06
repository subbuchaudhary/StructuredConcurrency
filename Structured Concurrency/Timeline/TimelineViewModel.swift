//
//  TimelineViewModel.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/5/24.
//

import Foundation

enum FetchableState {
    case fetching
    case idle
}

@MainActor
final class TimelineViewModel: ObservableObject {

    private let networkManager: NetworkManager

    @Published var timelinePosts: [PostViewModel] = []
    @Published private(set) var state: FetchableState = .idle

    let pageTitle: String = "Timeline"

    init(networkManager: NetworkManager = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func fetchData() async throws {
        var postsAndComments: [PostViewModel] = []
        state = .fetching
        let posts = try await networkManager.fetchPosts()

        try await withThrowingTaskGroup(of: PostViewModel.self) { group in
            posts.forEach { post in
                group.addTask {
                    let comments = try await self.networkManager.fetchComments(with: post.id)
                    return PostViewModel(postId: post.id,
                                         postTitle: post.title,
                                         postBody: post.body,
                                         comments: comments)
                }
            }

            for try await result in group {
                postsAndComments.append(result)
            }
            postsAndComments = postsAndComments.sorted(by: { $0.postId < $1.postId })
        }
        state = .idle
        timelinePosts = postsAndComments
    }
}
