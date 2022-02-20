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
    var body: some View
    {
        HStack(alignment: .center)
        {
            Text("Title")
                .foregroundColor(Theme.darkGray)
                .padding(.horizontal)
            
            Spacer()
            
            Text("Label")
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
        TableRowLabelCardView()
    }
}

struct TableRowChevronCardView : View
{
    var body: some View
    {
        HStack(alignment: .center)
        {
            Text("Title")
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
        TableRowChevronCardView()
    }
}
