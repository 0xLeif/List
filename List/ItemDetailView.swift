//
//  ItemDetailView.swift
//  List
//
//  Created by Zach Eriksen on 9/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    var item: ListItem
    
    @State private var isEditing = false
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.largeTitle)
                Text("\(item.subtitle)")
                    .font(.title)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .topLeading)
            .padding()
    
    }
}

//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailView()
//    }
//}
