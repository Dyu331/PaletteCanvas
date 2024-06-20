//
//  Level1View.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/5/23.
//

import SwiftUI

struct Level1View: View {
    @State var toTutorial=true
    @State var toResult=false
  
    @State var user1=Color(red: 0.5, green: 0.5, blue: 0.5)
    @State var user2=Color(red: 0.5, green: 0.5, blue: 0.5)
    @State var user3=Color(red: 0.5, green: 0.5, blue: 0.5)
    @Binding var rootActive:Bool
    
   
    @Binding var level1Completion:Bool
    @Binding var toHelpView:Bool
    
    @State var buttonColor=Color(.systemBlue)
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                ZStack{
                    NavigationLink(destination: TutorialView(), isActive: $toTutorial, label: {EmptyView()})
                    NavigationLink(destination: ResultView(rootActive: $rootActive).navigationBarBackButtonHidden(true), isActive: $toResult, label: {EmptyView()})
                }
               
               
                Text("Painting with Green Center")
                    .font(.title)
                    .padding().bold()
                Image("level 1 painting with palette").resizable()
                    .scaledToFit().padding()
                HStack{
                    VStack{
                        Color(red: user1.components.red, green: user1.components.green, blue:user1.components.blue ).padding().frame(width: 100,height:100)
                        ColorPicker("",selection:$user1,supportsOpacity: false).labelsHidden()/*.onChange(of: color1, perform: {newColor in
                            
                        })*/
                        
                    }
                    VStack{
                        Color(red: user2.components.red, green: user2.components.green, blue:user2.components.blue ).padding().frame(width: 100,height:100)
                        ColorPicker("",selection:$user2,supportsOpacity: false).labelsHidden()
                        
                    }
                    VStack{
                        Color(red: user3.components.red, green: user3.components.green, blue:user3.components.blue ).padding().frame(width: 100,height:100)
                        ColorPicker("",selection:$user3,supportsOpacity: false).labelsHidden()
                        
                    }
                    
                }
                Spacer()
                Button("Check Color") {
                    // Button action
                     if (colorSetsSimilar3(level1List, [user1,user2,user3]))
                    {
                         level1Completion=true
                         toResult=true
                         resultText="You have completed level 1: Painting With Green Center"
                         resultPalettes="palette 1"
                         resultDetail="This is an example of primary colors: blue, red, and yellow. They cannot be created by mixing other colors together, but they can be used to create all other colors on the color wheel. Therefore, they are the primary basis of color in art."
                         
                     }
                    else{
                        buttonColor=Color(.systemRed)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            buttonColor = Color(.systemBlue)
                                    }
                    }
                    
                }
                .foregroundColor(.white)
                .padding()
                .background(buttonColor.opacity(0.8))
                .cornerRadius(10).bold().fullScreenCover(isPresented: $toHelpView) {
                    Help1View(backToLevel: $toHelpView,user1:$user1,user2:$user2,user3:$user3).background(ClearFullCoverBackground())
                }
                Spacer()
                
            }.toolbar(content: {
                
            
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        toHelpView.toggle()
                    }) {
                        Image(systemName: "questionmark.circle").font(.system(size: 27))
                    }.frame(width:50)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        rootActive.toggle()
                            }) {
                                Image(systemName: "house").font(.system(size: 27))
                            }.frame(width:50)
                            }
                
                
            })
        }
    }
}

struct Level1View_Previews: PreviewProvider {
    static var previews: some View {
        Level1View(rootActive: .constant(false), level1Completion: .constant(false), toHelpView: .constant(false))
    }
}
