//
//  ContentView.swift
//  kirino-kadai5
//
//  Created by 神　樹里乃 on 2023/03/09.
//

import SwiftUI

struct ContentView: View {
    @State private var leftText: String = ""
    @State private var rightText: String = ""
    @State private var calculationResults: Int = 0

    var body: some View {
        HStack {
            VStack {
                HStack {
                    TextField("", text: $leftText)
                    Text("÷")
                    TextField("", text: $rightText)
                }
                .padding(.leading)
                Button {
                    print("ボタンタップ")
                } label: {
                    HStack {
                        Text("計算")
                    }

                }
                HStack {
                    Text("\(calculationResults)")
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .frame(width: 250)
            .textFieldStyle(.roundedBorder)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
