//
//  custom_text.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/29/23.
//

import SwiftUI

struct CustomText: View {
    var data: String
    var fontSize: CGFloat
    var color: Color
    var fontWeight: Font.Weight
    var body: some View {
                Text(data)
                    .font(.system(size: fontSize, weight: fontWeight ))
                    .foregroundColor(color)
                    .padding(.top).frame(
                        width: UIScreen.main.bounds.width,
                        alignment: .leading
                    )
            }
}

struct custom_text_Previews: PreviewProvider {
    static var previews: some View {
        CustomText(data: "testing text comp", fontSize: 40, color: Color("purple"), fontWeight: .bold)
    }
}
