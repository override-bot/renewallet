//
//  ContentView.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/28/23.
//

import SwiftUI

struct ContentView: View {
   
   @StateObject var userViewmodel = UserViewmodel()
    var body: some View {
        NavigationView{
            
            ZStack{
                Color(.white)
                VStack(spacing:10){
                    Spacer()
                    Image("intro")
                        .renderingMode(.original)
                        .resizable()
                        .frame(
                            width: UIScreen.screenWidth/1.1,
                            height:  UIScreen.screenHeight/3)
                    
                    CustomText(
                        data: "Get better with money.", fontSize: 40, color: Color("purple"),
                        fontWeight: .bold
                    ).padding(.leading, 25)
                    
                    
                    CustomText(
                        data:"Rene wallet is here to make financial transactions easier for you.", fontSize: 20, color: Color("purpleGrey"),
                        fontWeight: .regular
                    ).padding(.leading, 25)
                    Spacer()
                    
                  NavigationButton()
                    
                }
            }
        }
    }
}
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

