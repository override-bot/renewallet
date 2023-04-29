//
//  navigation_button.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/29/23.
//

import SwiftUI

struct NavigationButton: View {
    
    var body: some View {
        NavigationLink{
            LoginView()
        }label: {
            Text("Get started")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            
            
                .frame(width: UIScreen.screenWidth/1.5, height: 50)
                .background(Color("purple"))
                .cornerRadius(10)
                .padding(.top, 10)
            
            
        }
    }
}


struct navigation_button_Previews: PreviewProvider {
    static var previews: some View {
       NavigationButton()
    }
}
