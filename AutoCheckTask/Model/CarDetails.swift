//
//  CarDetails.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import Foundation

struct CarDetails: Decodable {
    let id: String
    let year: Int
    let mileage: Int
    let mileageUnit: String
    let vin: String
    let marketplacePrice: Int
    let imageUrl: String
    let model: Model
    let state: String
    let address: String
    let city: String
    let transmission: String
    let fuelType: String
    let bodyType: BodyType
    let interiorColor: String
    let exteriorColor: String
    let engineType: String
    let installment: Int
    let sold: Bool
}

struct Model: Decodable {
    let name: String
    let make: Make
}

struct Make: Decodable {
    let name: String
    let imageUrl: String
}

struct BodyType: Decodable {
    let name: String
    let imageUrl: String
}
