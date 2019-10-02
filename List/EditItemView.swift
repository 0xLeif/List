//
//  EditItemView.swift
//  List
//
//  Created by Zach Eriksen on 10/2/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

struct EditItemView: View {
    @EnvironmentObject private var object: ListObject
    @Binding var isPresented: Bool
    var section: ListSection?
    var item: ListItem?
    @State private var title: String = ""
    @State private var subtitle: String = ""
    
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
                    if let index = self.object.sections.firstIndex(where: { $0.id == self.section?.id }),
                        let itemIndex = self.object.sections[index].items.firstIndex(where: { $0.id == self.item?.id }) {
                        self.object.sections[index].items[itemIndex].title = self.title
                        self.object.sections[index].items[itemIndex].subtitle = self.subtitle
                    }
                    self.isPresented = false
                }) {
                    Text("Save")
                }
            }
            HStack {
                Text("Title:")
                Spacer()
                TextField("title", text: $title)
            }
            HStack {
                Text("Subtitle:")
                Spacer()
                TextField("subtitle", text: $subtitle)
            }
            Spacer()
            
            Spacer()
        }
        .padding()
        .onAppear {
            self.title = self.item?.title ?? ""
            self.subtitle = self.item?.subtitle ?? ""
        }
    }
    
    
}

//struct EditItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditItemView()
//    }
//}
