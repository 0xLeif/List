//
//  ListItemView.swift
//  List
//
//  Created by Zach Eriksen on 9/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

struct ListItemView: View {
    var item: ListItem
    
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            Text("\(item.subtitle)")
        }
        .padding()
    }
}


//struct ListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListItemView()
//    }
//}
