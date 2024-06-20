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
                        
                        Spacer()
                        
                        NavigationLink(destination: LevelView().navigationBarBackButtonHidden(true),isActive: $toNextPage ,label: {EmptyView()})
                        Spacer()
                        Text("tap to start").foregroundColor(Color(.systemBlue))
                        
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
