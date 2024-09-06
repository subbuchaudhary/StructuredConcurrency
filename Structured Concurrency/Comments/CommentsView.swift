//
//  CommentsView.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/6/24.
//

import SwiftUI

struct CommentsView: View {
    private let model: CommentsViewModel

    init(model: CommentsViewModel) {
        self.model = model
    }

    var body: some View {
        List(model.commentViewModels) { model in
            CommentView(model: model)
        }
        .listStyle(.plain)
        .navigationTitle("Comments")
    }
}

#Preview {
    CommentsView(model: CommentsViewModel.mock)
}
