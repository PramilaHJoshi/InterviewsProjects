//
//  ContentView.swift
//  SwifUI-Demo
//
//  Created by Pradeep Kumar Yeligandla on 02/09/24.
//

import SwiftUI

struct MyUIKitView: UIViewRepresentable {
    // Define any properties or state needed
    var color: UIColor

    func makeUIView(context: Context) -> UIView {
        // Create and configure your UIKit view
        let view = UIView()
        view.backgroundColor = color
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the UIKit view with new information
        uiView.backgroundColor = color
    }
}

struct ReorderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .fixedSize(horizontal: false, vertical: true)
    }
}
extension View {
    func customBorder() -> some View {
        self.modifier(ReorderModifier())
    }
}
struct ContentView: View {
    let school: SchoolModel
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MyUIKitView(color: .blue)
                       .frame(width: 200, height: 200)
            Text(school.school_name)
                .customBorder()
            if let overview = school.overview_paragraph {
                Text(overview)
                    .font(.body)
            } else {
                Text("No additional information available.")
                    .italic()
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(school.school_name)
    }
}

#Preview {
    ContentView(school: SchoolModel(dbn: "02M260", school_name: "Clinton School", overview_paragraph: "Students who are prepared for"))
}
