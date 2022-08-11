//
//  ContentView.swift
//  Jokes
//
//  Created by Fernando De Leon on 10/8/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    
    
    @State var jokes: Jokes = Jokes();
    @State var amPressed: Bool = false;
    private var fetch:FetchData = FetchData();
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[.pink,.blue]), startPoint: .topTrailing, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("monkeyFunny")
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 40)
                Text("Funny Jokes!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                    List {
                        JokeView(theJoke: "Joke 1")
                        JokeView(theJoke: "Joke 2")
                        JokeView(theJoke: "Joke 3")
                    }.listRowBackground(Color.green);
                    
                
                Button {
                   
                    print("get jokes");
                    self.amPressed.toggle();
                    Task {
                        do {
                            jokes = try await fetch.fetch();
                            print(jokes);
                        }
                    }
                    
                } label:{
                    FetchDataButton(pressed: self.amPressed);
                }
                
            }
        }
    }
}

struct FetchDataButton: View {
    
    var pressed:Bool;
    
    var body: some View {
        VStack {
            Image(pressed == true ? "haooyHamster" : "happyHamste2").aspectRatio(contentMode: .fit)
            Text("Press Me").font( .headline).foregroundColor(Color.white)
            
        }
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

struct JokeView: View {
    var theJoke:String;
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(theJoke)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2);
            
            
        }
    }
}
