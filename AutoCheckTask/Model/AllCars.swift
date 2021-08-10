//
//  AllCars.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import Foundation

struct AllCars: Decodable {
    let result: [CarResults]
    let pagination: CarsPagination
}

struct CarResults: Decodable {
    let id: String
    let title: String
    let imageUrl: String
    let year: Int
    let city: String
    let state: String
    let gradeScore: Double?
    let marketplacePrice: Int
}

struct CarsPagination: Decodable {
    let total: Int
    let currentPage: Int
    let pageSize: Int
}
