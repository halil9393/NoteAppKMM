//
//  NoteItem.swift
//  iosApp
//
//  Created by Halil Kucuk on 7.06.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteItem: View {
    
    var note:Note
    var onDeleteClick:()->Void
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack{
                Text(note.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: onDeleteClick, label: {
                    Image(systemName: "xmark").foregroundColor(.black)
                })
            }.padding(.bottom,3)
            
            Text(note.content).fontWeight(.light)
                .padding(.bottom,3)
            
            HStack{
                Spacer()
                Text(DateTimeUtil().formatNoteDate(dateTime: note.created))
                    .font(.footnote)
                    .fontWeight(.light)

            }
                        
        }).padding()
            .background(Color(hex:note.colorHex))
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
    }
}

#Preview {
    NoteItem(note: Note(
        id: nil, title: "MyNote", content: "NoteCotent", colorHex: 0xFF2323, created: DateTimeUtil().now()), onDeleteClick: {})
}
