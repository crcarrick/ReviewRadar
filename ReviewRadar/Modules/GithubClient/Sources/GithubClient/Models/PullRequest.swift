//
//  PullRequest.swift
//  GithubClient
//
//  Created by Chris Carrick on 5/24/25.
//

import Foundation

public struct PullRequest: Decodable, Identifiable, Sendable {
    public let id: Int
    public let url: URL
    public let number: Int
    public let title: String
    public let author: Author
    public let updatedAt: Date
    public let createdAt: Date
}
