//
//  ContentView.swift
//  CountTimerSwiftUI
//
//  Created by Yuri Tsuchikawa on 2023/06/28.
//

import SwiftUI

struct ContentView: View {
    @State var number: Int = 0
    var body: some View {
        NavigationStack {
            VStack {
                Text(String(number))
                    .fontWeight(.bold)
                    .font(.system(size: 96))
                    .offset(y: -30)
                HStack(spacing: 100) {
                    Button {
                        number += 1
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .fontWeight(.bold)
                            .frame(width: 45, height: 45)
                    }
                    Button {
                        number = max(number-1, 0)
                    } label: {
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .fontWeight(.bold)
                            .frame(width: 45, height: 45)
                    }
                }
                .offset(y: -45)
                NavigationLink {
                    TimerView(number: number)
                } label: {
                    Text("Start")
                        .frame(width: 180, height: 48)
                        .background(.teal)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                }
                .offset(y: 120)
            }
        }
    }
}

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    @State var number: Int!
    var body: some View {
        VStack {
            Text(String(number))
                .fontWeight(.bold)
                .font(.system(size: 96))
                .offset(y: -130)
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                if number == 0 {
                    dismiss()
                } else {
                    number -= 1
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .tint(.teal)
    }
}
