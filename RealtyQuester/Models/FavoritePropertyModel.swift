//
//  FavoritePropertyModel.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 17/06/1445 AH.
//

import Foundation

struct FavoritePropertyModel:Identifiable, Codable{
    var id: UUID
    var realtyId: UUID
    var userId:UUID
    var Property: PropertyModel
}

