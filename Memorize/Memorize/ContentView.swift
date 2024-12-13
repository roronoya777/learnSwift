//
//  ContentView.swift
//  Memorize
//
//  Created by Liyu Shen on 11/28/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😄","😅","😂","😉","🥹","😀","😜","🤩","😤","😢","🤩"]
    @State var CardCount = 4
    
    var body: some View {
        VStack{
            Cards
            HStack{
                CardAdder
                Spacer()
                CardRemover
            }
            .imageScale(.large)
            .font(.largeTitle)
        .padding()
        }
        
    }
    var Cards: some View{
        HStack{
            ForEach(0..<CardCount, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(Color.orange)
        .padding()
    }
    var CardAdder: some View{
            Button(action:{
                if CardCount < emojis.count{
                            CardCount += 1
                }
            }, label:{
                Image(systemName: "rectangle.fill.badge.plus")
            })
    }
    var CardRemover: some View{
            Button(action:{
                if CardCount > 1 {
                            CardCount -= 1
                }
            }, label:{
                Image(systemName: "rectangle.fill.badge.minus")
            })
    }
}



struct CardView: View {
    let content : String
    @State var isFaceUp = true
    var body: some View {
        ZStack () {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else{
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
#Preview {
    ContentView()
}
