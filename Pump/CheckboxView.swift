//
//  CheckboxView.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 3/23/23.
//

import SwiftUI

struct CheckboxRowView: View {
    @Binding var numberOfCheckboxes: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfCheckboxes, id: \.self) { index in
                CheckboxView(isChecked: false)
            }
        }
    }
}

struct CheckboxView: View {
    @State var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            if isChecked {
                Image(systemName: "checkmark.square.fill")
            } else {
                Image(systemName: "square")
            }
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}


struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(isChecked: false)
    }
}
