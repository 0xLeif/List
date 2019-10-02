//
//  EditSectionView.swift
//  List
//
//  Created by Zach Eriksen on 9/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

struct EditSectionView: View {
    @EnvironmentObject private var object: ListObject
    @Binding var isPresented: Bool
    @Binding var section: ListSection?
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
                    if let index = self.object.sections.firstIndex(where: { $0.id == self.section?.id }) {
                        self.object.sections[index].header = self.title
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
            Spacer()
            
            Spacer()
        }
        .padding()
        .onAppear {
            self.title = self.section?.header ?? ""
        }
    }
}

//struct EditSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditSectionView()
//    }
//}
