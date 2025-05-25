//
//  GithubClient.swift
//  GithubClient
//
//  Created by Chris Carrick on 5/24/25.
//

import Foundation

public struct GithubClient {
    private var token: String
    
    public init(token: String) {
        self.token = token
    }
    
    public func send<T>(_ ghQuery: GithubQuery<T>) async throws -> T? where T: Decodable & Sendable {
        var request = URLRequest(url: URL(string: "https://api.github.com/graphql")!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONSerialization.data(withJSONObject: [
            "query": ghQuery.query,
            "variables": ghQuery.variables ?? [:]
        ])
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        if let raw = String(data: data, encoding: .utf8) {
            print(raw)
        }
        
        let decoded = try JSONDecoder().decode(GraphQLResponse<T>.self, from: data)
        
        if let errors = decoded.errors {
            print("❌ GraphQL errors:")
            for error in errors {
                print("- \(error.message)")
            }
        }
        
        return decoded.data
    }
}
