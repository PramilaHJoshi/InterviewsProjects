//
//  SchoolListView.swift
//  SwifUI-Demo
//
//  Created by Pradeep Kumar Yeligandla on 04/09/24.
//

import SwiftUI

struct SchoolListView: View {
    @ObservedObject var viewModel: SchoolViewModel = SchoolViewModel(_schoolServices: SchoolService())
  //  @ObservedObject private var viewModel = SchoolViewModel()
    var body: some View {
        
        NavigationView {
            List(viewModel.schools) { school in
                NavigationLink(destination: ContentView(school: school)) {
                    VStack(alignment: .leading) {
                        Text(school.school_name)
                            .font(.headline)
                        Text("DBN: \(school.dbn)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("NYC High Schools")
            .onAppear {
                viewModel.fetchSchools()
            }
            .alert(viewModel.errorMessage ?? "Error", isPresented: $viewModel.isErrorPresented, presenting: viewModel.errorMessage) { errorMessage in
                Button("OK", role: .cancel) {}
            } message: { errorMessage in
                Text(errorMessage)
            }
        }
    }
}

#Preview {
    SchoolListView()
}
