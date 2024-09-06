//
//  TimelineView.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/5/24.
//

import SwiftUI

struct TimelineView: View {
    @ObservedObject private var viewModel = TimelineViewModel()
    @State private var shouldShowAlert: Bool = false
    @State private var errorMessage: String = ""

    private var listView: some View {
        List($viewModel.timelinePosts) { post in
            let commentsModel = CommentsViewModel(comments: post.comments.wrappedValue)
            NavigationLink(destination: CommentsView(model: commentsModel)) {
                PostView(viewModel: post.wrappedValue)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewModel.state {
                case .fetching:
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                case .idle:
                    listView
                        .listStyle(.plain)
                }
            }
            .navigationTitle(viewModel.pageTitle)
            .alert(isPresented: $shouldShowAlert) {
                Alert(title: Text("Error"),
                      message: Text(errorMessage),
                      dismissButton: .default(Text("OK")))
            }
            .task {
                do {
                    try await viewModel.fetchData()
                } catch {
                    errorMessage = error.localizedDescription
                    shouldShowAlert = true
                }
            }
        }
    }
}

#Preview {
    TimelineView()
}
