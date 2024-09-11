//
//  SchoolService.swift
//  SwifUI-Demo
//
//  Created by Pradeep Kumar Yeligandla on 04/09/24.
//

import Foundation
import Combine

protocol SchoolServiceProtocol {
    func fetchSchool() -> AnyPublisher<[SchoolModel], Error>
}
class SchoolService: SchoolServiceProtocol  {
    private let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    func fetchSchool() -> AnyPublisher<[SchoolModel], Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [SchoolModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
}
