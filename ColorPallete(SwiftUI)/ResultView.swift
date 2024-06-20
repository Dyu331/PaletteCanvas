//
//  resultView.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/7/23.
//

import SwiftUI

struct ResultView: View {
    @Binding var rootActive:Bool
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Congrats!!")
                    .font(.title)
                    .padding().bold()
                Text(resultText).multilineTextAlignment(.center)
                Image(resultPalettes).resizable().scaledToFit().padding()
                Text(resultDetail).multilineTextAlignment(.center)
                if currentLevel==1
                {
                    Spacer()
                    Image("primary color wheel").resizable().scaledToFit().padding().frame(width: 250,height: 250)
                    
                }
                else if currentLevel==2
                {
                    Spacer()
                    Image("triadic color wheel").resizable().scaledToFit().padding().frame(width: 250,height: 250)
                    
                }
                else if currentLevel==3
                {
                    Spacer()
                    Image("complimentary color wheel").resizable().scaledToFit().padding().frame(width: 250,height: 250)
                }
                else if currentLevel==4
                {
                    Spacer()
                    Image("analogous color wheel").resizable().scaledToFit().padding().frame(width: 250,height: 250)
                }
                else if currentLevel==5
                {
                    Spacer()
                    Image("monochromatic color wheel").resizable().scaledToFit().padding().frame(width: 250,height: 250)
                }
                
                Spacer()
                Text("Tap anywhere to continue").foregroundColor(.blue)
                Spacer()
            }
        }.onTapGesture {
            rootActive=false
        }.padding()
    }
}

struct resultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(rootActive:.constant(false))
    }
}
