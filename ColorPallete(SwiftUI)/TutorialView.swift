//
//  TutorialView.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/6/23.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        
        ScrollView{
            VStack{
                Text("Tutorial")
                    .font(.title)
                    .padding().bold()
                Text("Pay attention to the colors in the circles. ")
                Image("tutorial 1")
                Text("Try to match those color using the color picker.").padding(.top)
                Image("tutorial 2")
                Text("You can use any function in the color picker to recreate the color on the painting.").padding().multilineTextAlignment(.center)
                Image("tutorial 3").resizable().frame(width:300,height: 300)
                Text("When you think you've got all the correct colors, check to see if they are right!").padding().multilineTextAlignment(.center)
                Text("If you are really stuck (like REALLY stuck), click on the help button to get the right answer...But try not to use it!").padding(
                ).multilineTextAlignment(.center)
                Image("tutorial 4")
                
                
                
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
