//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  TableRowCardView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/22.
//

import SwiftUI

// enum TableRows : CaseIterable
// {
//     case label
//     case none
//     case chevron
//     case chevronLabel
//     case icon
//     case `switch`
//     case chevronIcon
// }

struct TableRowNoneCardView : View
{
    var body: some View
    {
        HStack(alignment: .center)
        {
            Text("Title")
                .foregroundColor(Theme.darkGray)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, minHeight: Theme.tableRowHeight, alignment: .leading)
        .background(Theme.primaryLight)
        .cornerRadius(Theme.cornerRadius)
    }
}

struct TableRowNoneCardView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TableRowNoneCardView()
    }
}

struct TableRowLabelCardView : View
{
    let title: String
    let label: String
    
    var body: some View
    {
        HStack(alignment: .center)
        {
            Text(title)
                .truncationMode(.tail)
                .lineLimit(1)
                .foregroundColor(Theme.darkGray)
                .padding(.horizontal)
            
            Spacer()
            
            Text(label)
                .truncationMode(.tail)
                .lineLimit(3)
                .foregroundColor(Theme.gray)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, minHeight: Theme.tableRowHeight, alignment: .leading)
        .background(Theme.primaryLight)
        .cornerRadius(Theme.cornerRadius)
    }
}

struct TableRowLabelCardView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TableRowLabelCardView(title: "Title", label: "Label")
    }
}

struct TableRowChevronCardView : View
{
    let title: String
    
    var body: some View
    {
        HStack(alignment: .center)
        {
            Text(title)
                .truncationMode(.tail)
                .lineLimit(1)
                .foregroundColor(Theme.darkGray)
                .padding(.horizontal)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Theme.gray)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, minHeight: Theme.tableRowHeight, alignment: .leading)
        .background(Theme.primaryLight)
        .cornerRadius(Theme.cornerRadius)
    }
}

struct TableRowChevronCardView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TableRowChevronCardView(title: "Title")
    }
}
