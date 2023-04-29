//
//  ContentView.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/28/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        ZStack{
            Color(.white)
            VStack(spacing:10){
               
                Image("intro")
                    .renderingMode(.original)
                    .resizable()
                    .frame(
                        width: UIScreen.main.bounds.width/1.1,
                        height:  UIScreen.main.bounds.height/3)
                   
                Text("Get better with money.")
                    .font(.system(size: 40, weight: .bold ))
                    .foregroundColor(Color("purple"))
                    .padding(.top).frame(
                        width: UIScreen.main.bounds.width,
                        alignment: .leading
                    ).padding(.leading, 15)
                    
                Text("Rene wallet is here to make financial transactions easier for you.")
                    .font(.system(size: 20, weight: .light ))
                    .foregroundColor(Color("purpleGrey"))
                    .frame(
                        width: UIScreen.main.bounds.width,
                        alignment: .leading
                    ).padding(.leading, 15)
               
                
            }
        }
    }
    }

  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
