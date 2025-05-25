//
//  GraphQL.swift
//  GithubClient
//
//  Created by Chris Carrick on 5/25/25.
//

struct GraphQLResponse<T: Decodable>: Decodable {
    let data: T?
    let errors: [GraphQLError]?
}

struct GraphQLError: Decodable {
    let path: [String]
    let message: String
    let locations: [GraphQLErrorLocation]
}

struct GraphQLErrorLocation: Decodable {
    let line: Int
    let column: Int
}
