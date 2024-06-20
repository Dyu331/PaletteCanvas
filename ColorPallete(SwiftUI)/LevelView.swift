//
//  SwiftUIView.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/4/23.
//

import SwiftUI

struct LevelView: View {
    @State var toDescriptionView=false
    @AppStorage("Completion_Level1") var level1Completion=false
    @AppStorage("Completion_Level2") var level2Completion=false
    @AppStorage("Completion_Level3") var level3Completion=false
    @AppStorage("Completion_Level4") var level4Completion=false
    @AppStorage("Completion_Level5") var level5Completion=false
    
    @State var toPalettesView=false
    
    
    var body: some View {
        NavigationView {
            
            VStack{
                ZStack{
                    NavigationLink(destination: PalettesView(level1Completed: $level1Completion,level2Completed: $level2Completion,level3Completed: $level3Completion,level4Completed: $level4Completion,level5Completed: $level5Completion,rootActive: $toPalettesView).navigationBarBackButtonHidden(true), isActive: $toPalettesView, label:{ EmptyView()})
                    NavigationLink(destination: DescriptionView(rootActive:$toDescriptionView, level1Completion: $level1Completion,level2Completion: $level2Completion,level3Completion: $level3Completion,level4Completion: $level4Completion,level5Completion: $level5Completion).navigationBarBackButtonHidden(true), isActive: $toDescriptionView, label:{ EmptyView()})
                }
                
                Text("Color Palettes")
                    .font(.title)
                    .padding().bold()
                Spacer()
                
                
                //level 1 button
                Button(action: {
                    currentLevel=1
                    toDescriptionView.toggle()
                    descriptionTitle="Painting with Green Center"
                    descriptionImage="Level 1_PrimaryColor_Painting with Green Center"
                    descriptionText="This painting was created by Vasily Kandinsky, a a Russian painter in the 1900s. He believed that art should express the artist's innermost feelings and ideas rather than simply imitate the visible world, therefore his work often featured bright colors and dynamic, geometric shapes arranged in abstract compositions. "
                    //level1Completion.toggle()
                    
                }) {
                    Image("level1ButtonExample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 100) // change the values here
                }
                
                //level 2
                Button(action: {
                    currentLevel=2
                    toDescriptionView.toggle()
                    descriptionTitle="The Milkmaid"
                    descriptionImage="Level 2_TriadicColors_TheMilkmaid"
                    descriptionText="This painting was painted by Johannes Vermeer, a Dutch artist during the 17th century. Vermeer was known for his meticulous attention to detail and masterful use of light and shadow in his genre paintings. Vermeer's color palette is often characterized by rich, warm tones, with an emphasis on blues and yellows. "
                    //level2Completion.toggle()
                    
                }) {
                    Image("level1ButtonExample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 100)
                }.disabled(!level1Completion).buttonStyle(.plain)
                
                //level 3
                Button(action: {
                    currentLevel=3
                    toDescriptionView.toggle()
                    descriptionTitle="The Scream"
                    descriptionImage="Level 3_ComplimentaryColors_TheScream"
                    descriptionText="The Scream is one of the most iconic and powerful work of Edvard Munch, who is known for the expressive and emotive qualities in his works. Munch employed a vivid color palette to convey the intense emotions and psychological turmoil depicted in the painting, such as the swirling lines and distorted forms rendered in vivid hues of red, orange, green, and blue."
                    //level3Completion.toggle()
                }) {
                    Image("level1ButtonExample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 100)
                }.disabled(!level2Completion).buttonStyle(.plain)
                
                //level 4
                Button(action: {
                    currentLevel=4
                    toDescriptionView.toggle()
                    descriptionTitle="The Olive Trees"
                    descriptionImage="Level 4_AnalogousColor_TheOliveTrees"
                    descriptionText="This painting by Vincent van Gogh is characterized by its unique and vibrant use of color, evident to his bold and expressive style. He believes that art should be a means of expressing the emotions and innermost thoughts of the artist. The artist's usage of bright colors creates movement and vitality, evoking a sense of energy, emotion, and the intensity of the natural world as he experienced it."
                    //level4Completion.toggle()
                }) {
                    Image("level1ButtonExample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 100)
                }.disabled(!level3Completion).buttonStyle(.plain)
                
                //level 5
                Button(action: {
                    currentLevel=5
                    toDescriptionView.toggle()
                    descriptionTitle="Portrait of a Young Girl"
                    descriptionImage="Level 5_MonoChromatic_PortraitOfAYoungGirl"
                    descriptionText="This painting was created by Pierre-Auguste Renoir, a French Impressionist painter known for his vibrant and lively style. He aimed to capture the fleeting effects of light and color in the natural world. Renoir's works are often characterized by his loose brushwork and warm color palettes. The use of varies shades of red in the painting captured the youthfulness and innocence of the girl and portrayed her in a warm, intimate manner"
                }) {
                    Image("level1ButtonExample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 100)
                }.disabled(!level4Completion).buttonStyle(.plain)
                
                Spacer()
                
       
                
                /*NavigationLink(destination: PalettesView(level1Completed: $level1Completion,level2Completed: $level2Completion,level3Completed: $level3Completion,level4Completed: $level4Completion,level5Completed: $level5Completion), label:{ Label {
                    Text("")
                } icon: {
                    Image("level1ButtonExample")
                        .resizable()
                        .scaledToFit().frame(width: 330,height: 125)
                }})*/
                
                Button(action: {
                    toPalettesView.toggle()
                }) {
                    Image("level1ButtonExample")
                        .resizable()
                        .frame(width: 330, height: 125) // set the size of the image
                }
                
                /*Button("Check Color") action:{
                    // Button action
                     
                    
                }
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .cornerRadius(10).bold()*/
                
    
            }.toolbar(content: {
                HStack{
                    Button("reset"){
                        level1Completion=false
                        level2Completion=false
                        level3Completion=false
                        level4Completion=false
                        level5Completion=false
                    }
                    Button("unlock"){
                        level1Completion=true
                        level2Completion=true
                        level3Completion=true
                        level4Completion=true
                        level5Completion=true
                    }
                }
                
            })
        }
    }
    
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            LevelView()
        }
    }
}
