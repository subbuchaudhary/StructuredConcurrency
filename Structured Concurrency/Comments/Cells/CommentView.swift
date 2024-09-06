//
//  CommentView.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/6/24.
//

import SwiftUI

struct CommentView: View {
    private let model: CommentViewModel
    
    init(model: CommentViewModel) {
        self.model = model
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Text("Comment Id: \(model.commentId)")
                .font(.system(size: 14))
                .foregroundColor(.black)
            
            Text(model.name)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            
            Text(model.email)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(red: 37/255.0, green: 66/255.0, blue: 146/255.0))
            
            Text(model.comment)
                .font(.system(size: 14))
                .foregroundColor(Color(red: 80/255.0, green: 80/255.0, blue: 80/255.0))
        }
    }
}

#Preview {
    CommentView(model: CommentViewModel.mock)
}
