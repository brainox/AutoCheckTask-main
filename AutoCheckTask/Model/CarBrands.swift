//
//  CarBrands.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import Foundation

struct CarBrands: Decodable {
    let makeList: [MakeList]
    let pagination: Pagination
}

struct MakeList: Decodable {
    let id: Int
    let name: String
    let imageUrl: String
}

struct Pagination: Decodable {
    let total: Int
    let currentPage: Int
    let pageSize: Int
}
