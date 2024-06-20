//
//  ContentView.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/4/23.
//

import SwiftUI

struct TitleView: View {
    @State private var toNextPage = false
    
    var body: some View {
        NavigationView {
                
                ZStack{
                    
                    Rectangle().fill(.white).onTapGesture {
                        toNextPage.toggle()
                    }
                    
                    VStack {
                        
                        Spacer()
                        Image("icon").resizable()
                            .scaledToFit().padding().onTapGesture {
                                toNextPage.toggle()
                            }
                        
                        Text("Palette Canvas")
                            .font(.title).bold()
                            .padding(.top).onTapGesture {
                                toNextPage.toggle()
                            }
                        Spacer()
                        
                        NavigationLink(destination: LevelView().navigationBarBackButtonHidden(true),isActive: $toNextPage ,label: {EmptyView()})
                        Spacer()
                        Text("Tap to start").foregroundColor(Color(.systemBlue))
                        
                    }
                    .padding()
                }
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
