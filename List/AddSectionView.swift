//
//  AddSectionView.swift
//  List
//
//  Created by Zach Eriksen on 9/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

struct AddSectionView: View {
    @EnvironmentObject private var object: ListObject
    @Binding var isPresented: Bool
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Cancel")
                }
                Spacer()
                Button(action: {
                    self.object.sections.append(ListSection(header: self.title, items: []))
                    self.isPresented = false
                }) {
                    Text("Add")
                }
            }
            HStack {
                Text("Title:")
                Spacer()
                TextField("title", text: $title)
            }
            Spacer()
            
            Spacer()
        }
        .padding()
    }
}

//struct AddSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSectionView()
//    }
//}
