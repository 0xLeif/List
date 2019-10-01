//
//  AddingItemView.swift
//  List
//
//  Created by Zach Eriksen on 9/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

struct AddingItemView: View {
    @EnvironmentObject private var object: ListObject
    @Binding var isPresented: Bool
    @Binding var section: ListSection?
    @State private var title: String = ""
    @State private var count: String = ""
    
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
                    if let index = self.object.sections.firstIndex(where: { $0.id == self.section?.id }) {
                        self.object.sections[index].items.append(ListItem(title: self.title,
                                                                          subtitle: String(self.count)))
                    }
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
            HStack {
                Text("Count:")
                Spacer()
                TextField("count", text: $count)
            }
            Spacer()
            
            Spacer()
        }
        .padding()
    }
}

//struct AddingItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddingItemView()
//    }
//}
