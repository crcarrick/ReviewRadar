//
//  GithubQuery.swift
//  GithubClient
//
//  Created by Chris Carrick on 5/24/25.
//

import Foundation

public struct GithubQuery<T: Decodable & Sendable> {
    let query: String
    let variables: [String: Any]?
    
    public static func reviewRequestedPRs(for username: String) -> GithubQuery<SearchResult<PullRequest>> {
        .init(
            query: """
            query PullRequestsNeedingReview($query: String!) {
                search(query: $query, type: ISSUE, first: 10) {
                    nodes {
                        ... on PullRequest {
                            id
                            url
                            title
                            number
                            updatedAt
                            createdAt
                            author {
                                login
                            }
                        }
                    }
                }
            }
            """,
            variables: ["query": "review-requested:\(username) is:open is:pr"],
        )
    }
}
