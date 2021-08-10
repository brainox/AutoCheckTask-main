//
//  CarMedia.swift
//  AutoCheckTask
//
//  Created by Decagon on 10/08/2021.
//

import Foundation

struct CarMedia: Decodable {
    let carMediaList: [CarMediaList]
    let pagination: CarMediaPagination
}

struct CarMediaList: Decodable {
    let id: Int
    let name: String
    let url: String
    let createdAt: String
    let type: String
}

struct CarMediaPagination: Decodable {
    let total: Int
    let currentPage: Int
    let pageSize: Int
}
