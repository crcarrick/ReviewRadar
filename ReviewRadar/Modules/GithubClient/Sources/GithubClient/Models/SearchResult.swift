//
//  SearchResult.swift
//  GithubClient
//
//  Created by Chris Carrick on 5/24/25.
//

public struct SearchNodes<T: Decodable & Sendable>: Decodable, Sendable {
    public let nodes: [T]
}

public struct SearchResult<T: Decodable & Sendable>: Decodable, Sendable {
    public let search: SearchNodes<T>
}
