//
//  ViewModel.swift
//  SwifUI-Demo
//
//  Created by Pradeep Kumar Yeligandla on 04/09/24.
//

import Foundation
import Combine

class SchoolViewModel: ObservableObject {
    @Published var schools:[SchoolModel] = []
    @Published var errorMessage: String?
    @Published var isErrorPresented: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    var schoolServices: SchoolServiceProtocol?
    init(_schoolServices: SchoolServiceProtocol) {
        self.schoolServices = _schoolServices
    }
    
    func fetchSchools() {
        schoolServices?.fetchSchool()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching schools: \(error)")
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { schools in
                print("Fetched schools: \(schools)")
                self.schools = schools
            })
            .store(in: &cancellables)
        
    }
}
