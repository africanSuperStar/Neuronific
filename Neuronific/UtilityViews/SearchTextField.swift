//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  SearchTextField.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

public struct SearchTextField : View
{
    @Binding var searchText: String

    @State private var hasFocus = false
    
    public var body: some View
    {
        HStack
        {
            Spacer()

            Image(systemName: "magnifyingglass")
            
            TextField(
                "",
                text: self.$searchText,
                onEditingChanged:
                {
                    currentlyEditing in
                
                    hasFocus = currentlyEditing
                }
            )
            .border(Color.clear, width: 0)
            .placeHolder(
                Text(searchText.isEmpty ? "Search..." : ""), show: true
            )
            .textFieldStyle(PlainTextFieldStyle())
            .foregroundColor(.white)
            .padding(Theme.padding)

            Spacer()
        }
        .foregroundColor(.white)
        .background(
            Theme.transparentGray
        )
        .overlay(
            RoundedRectangle(cornerRadius: Theme.cornerRadius)
                .stroke(hasFocus ? Color.blue : Color.white, lineWidth: hasFocus ? 4 : 0)
        )
        .cornerRadius(Theme.cornerRadius)
        .shadow(
            color: .black,
            radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
            x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
            y: 2.0
        )
    }

    public init(searchText: Binding<String>)
    {
        self._searchText = searchText
    }
}

struct SearchTextField_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchTextField(searchText: .constant(""))
    }
}
