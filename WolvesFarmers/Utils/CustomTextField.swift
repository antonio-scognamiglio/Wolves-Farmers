//
//  CustomTextView.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: Text
    @Binding var username: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .center) {
            if username.isEmpty { placeholder }
            TextField("", text: $username, onEditingChanged: editingChanged, onCommit: commit).multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
    }
    
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholder: Text("Insert your nickname"), username: .constant(""))
    }
}
