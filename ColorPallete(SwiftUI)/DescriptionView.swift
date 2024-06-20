//
//  DescriptionView.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/5/23.
//

import SwiftUI

struct DescriptionView: View {
    @State var toLevel1=false
    @State var toLevel2=false
    @State var toLevel3=false
    @State var toLevel4=false
    @State var toLevel5=false
    @Binding var rootActive:Bool
    
    @Binding var level1Completion:Bool
    @Binding var level2Completion:Bool
    @Binding var level3Completion:Bool
    @Binding var level4Completion:Bool
    @Binding var level5Completion:Bool
    
    @State var toHelpView=false
    
    var body: some View {
        
        
        NavigationView{
            
            VStack{
                ZStack
                {
                    NavigationLink(destination: Level1View(rootActive:$rootActive, level1Completion: $level1Completion, toHelpView: $toHelpView).navigationBarBackButtonHidden(true), isActive: $toLevel1, label: {EmptyView()})
                    NavigationLink(destination: Level2View(rootActive: $rootActive, level2Completion: $level2Completion,toHelpView: $toHelpView).navigationBarBackButtonHidden(true), isActive: $toLevel2, label: {EmptyView()})
                    NavigationLink(destination: Level3View(rootActive: $rootActive,level3Completion: $level3Completion, toHelpView: $toHelpView).navigationBarBackButtonHidden(true), isActive: $toLevel3, label: {EmptyView()})
                    NavigationLink(destination: Level4View(rootActive: $rootActive,level4Completion:$level4Completion,toHelpView: $toHelpView).navigationBarBackButtonHidden(true), isActive: $toLevel4, label: {EmptyView()})
                    NavigationLink(destination: Level5View(rootActive: $rootActive,level5Completion:$level5Completion, toHelpView: $toHelpView).navigationBarBackButtonHidden(true), isActive: $toLevel5, label: {EmptyView()})
                }
                
                
                
                Spacer()
                Text(descriptionTitle)
                    .font(.title)
                    .padding().bold()
                Spacer()
                Image(descriptionImage).resizable()
                    .scaledToFit().padding()
                Spacer()
                Text(descriptionText).multilineTextAlignment(.center)
                Spacer()
                Spacer()
                Button(action: {
                    switch currentLevel
                    {
                    case 1:
                        toLevel1.toggle()
                    case 2:
                        toLevel2.toggle()
                    case 3:
                        toLevel3.toggle()
                    case 4:
                        toLevel4.toggle()
                    case 5:
                        toLevel5.toggle()
                    default:
                        toLevel1.toggle()
                    }
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(10).bold()
                }
            }.padding()
            
            
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(rootActive:.constant(false), level1Completion: .constant(false),level2Completion: .constant(false),level3Completion: .constant(false),level4Completion: .constant(false),level5Completion: .constant(false))
    }
}
