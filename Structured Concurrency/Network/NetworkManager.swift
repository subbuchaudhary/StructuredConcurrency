//
//  NetworkManager.swift
//  Structured Concurrency
//
//  Created by Subba Nelakudhiti on 9/5/24.
//

import Foundation

enum NetworkError: Error {
  case invalidRequestError(String)
  case transportError(Error)
  case serverError(statusCode: Int, httpResponse: HTTPURLResponse, data: Data)
  case noData
  case dataError(Error)
}

final class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchPosts() async throws -> [Posts] {
        return try await fetchData(from: "https://jsonplaceholder.typicode.com/posts")
    }

    func fetchComments(with postId: Int) async throws -> [Comments] {
        return try await fetchData(from: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments")
    }

    private func fetchData<DataModel: Decodable>(from urlString: String) async throws -> DataModel {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidRequestError("Invalid URL")
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        let dataModel = try JSONDecoder().decode(DataModel.self,
                                                 from: try mapResponse(response: (data,response)))
        return dataModel
    }

    private func mapResponse(response: (data: Data, response: URLResponse)) throws -> Data {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return response.data
        }

        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        default:
            throw NetworkError.serverError(statusCode: httpResponse.statusCode, 
                                           httpResponse: httpResponse,
                                           data: response.data)
        }
    }
}
