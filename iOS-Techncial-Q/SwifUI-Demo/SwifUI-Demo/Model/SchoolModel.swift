//
//  SchoolModel.swift
//  SwifUI-Demo
//
//  Created by Pradeep Kumar Yeligandla on 04/09/24.
//

import Foundation

struct SchoolModel: Identifiable, Decodable {
    let dbn: String
    let school_name: String
    let overview_paragraph: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case school_name
        case overview_paragraph
    }
    
    var id: String {
        return dbn
    }
}
