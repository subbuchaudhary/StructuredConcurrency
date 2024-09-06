//
//  PostView.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/5/24.
//

import SwiftUI

struct PostView: View {
    let viewModel: PostViewModel

    init(viewModel: PostViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Post Id: \(viewModel.postId)")
                .font(.system(size: 14))
                .foregroundColor(.black)
            Text(viewModel.postTitle)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color(red: 37/255.0, green: 66/255.0, blue: 146/255.0))
            Text(viewModel.postBody)
                .font(.system(size: 14))
                .foregroundColor(Color(red: 80/255.0, green: 80/255.0, blue: 80/255.0))

            Text(viewModel.commentsText)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color(red: 37/255.0, green: 66/255.0, blue: 146/255.0))
        }
    }
}

#Preview {
    return PostView(viewModel: PostViewModel.mock)
}
