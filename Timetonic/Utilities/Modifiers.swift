//
//  Modifiers.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI

struct TextFieldMock: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.125).cornerRadius(15))
            .font(.headline)
    }
}

struct ButtonMock: ViewModifier {
    func body(content: Content) -> some View {
        content
                 .padding()
                 .foregroundColor(.white)
                 .frame(width: UIScreen.main.bounds.width / 1.1)
                 .background(Color.timeTonic)
                 .cornerRadius(15)
                 .font(.headline)
                 .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)

    }
}

struct SoftLabelMock: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.black.opacity(0.5))
            .font(.caption)
    }
}



extension View{
    func withCustomTextFieldStyle() -> some View{
        modifier(TextFieldMock())
    }
    
    func withCustomButtonStyle() -> some View{
        modifier(ButtonMock())
    }
    
    func withCustomLabelStyle() -> some View{
        modifier(SoftLabelMock())
    }
}

