//
//  NoteDetailScreen.swift
//  iosApp
//
//  Created by Halil Kucuk on 10.06.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteDetailScreen: View {
    private var noteDataSource:NoteDataSource
    private var noteId:Int64? = nil
    
    @StateObject var viewModel = NoteDetailViewModel(noteDataSource: nil)
    @Environment (\.presentationMode) var presentation
    
    init(noteDataSource: NoteDataSource, noteId: Int64? = nil) {
        self.noteDataSource = noteDataSource
        self.noteId = noteId
    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            TextField("Enter a title", text: $viewModel.noteTitle).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            TextField("Enter a content", text: $viewModel.noteContent)
            Spacer()
        }.toolbar(content: {
            Button(action: {
                viewModel.saveNote(onSaved: {
                    self.presentation.wrappedValue.dismiss()
                })
            }, label: {
                Image(systemName: "checkmark")
            })
        })
        .padding()
        .background(Color(hex: viewModel.noteColor))
        .onAppear{
            viewModel.setParamsAndLoad(noteDataSource: noteDataSource, noteId: noteId)
        }
        
    }
}

#Preview {
    EmptyView()
}
