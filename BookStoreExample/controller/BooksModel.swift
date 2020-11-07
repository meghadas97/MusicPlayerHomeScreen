//
//  BooksModel.swift
//  BookStoreExample
//
//  Created by Monali Das on 07/11/20.
//  Copyright © 2020 Monali Das. All rights reserved.
//

import Foundation

struct BooksModel : Codable{
    let kind           : String?
    let totalItems     : Int?
    let items          : [Items]
    
}

struct Items : Codable{
    var kind       :  String?
    var id         :  String?
    var volumeInfo :  VolumeInfo?
    var imageLinks :  ImageLinks?
}

struct VolumeInfo : Codable{
    var title     : String?
    var subtitle  : String?
}

struct ImageLinks : Codable{
    var smallThumbnail : String?
    var thumbnail      : String?
}
