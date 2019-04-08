//
//  Person.swift
//  DispatchQueueMainRandomUserGeneratorAPI
//
//  Created by Nelson Gonzalez on 1/24/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

//struct Person: Codable {
//
//    var name: Name
//    var phone: String
//
//    struct Name: Codable {
//        var first: String
//        var last: String
//
//    }
//}
//
//
//struct PersonResults: Codable {
//    var results: [Person]
//
//}

struct Person: Codable {
    //making our own custom decodable initializer
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self )
        self.phone = try container.decode(String.self, forKey: .phone)
        
        //Decode name from nested container
        let nameContainer = try container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .name)
        let firstName = try nameContainer.decode(String.self, forKey: .first)
        let lastName = try nameContainer.decode(String.self, forKey: .last)
        self.name = firstName + " " + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case phone
    }
    
    enum NameCodingKeys: String, CodingKey {
        case first
        case last
    }
    
    var name: String
    var phone: String
    
}


struct PersonResults: Codable {
    var results: [Person]
    
}
