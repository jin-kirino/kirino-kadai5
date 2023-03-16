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
    @State private var calculationResults: Double = 0.0
    @State private var isShowingAlert: Bool = false

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
                    didTapAction(leftText: leftText, rightText: rightText)
                } label: {
                    HStack {
                        Text("計算")
                    }
                }
                HStack {
                    Text("\(floor(calculationResults * 100000) / 100000)")
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .frame(width: 250)
            .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .alert("課題５", isPresented: $isShowingAlert) {
            Button("OK") { }
        }
        .onAppear {
            calculationResults = 0.0
        }
    }

    private func didTapAction(leftText: String, rightText: String) {
        guard let numberOfStraws = Double(leftText), let numberOfDivisors = Double(rightText) else {
            isShowingAlert = true
            return
        }
        if numberOfDivisors != 0 {
            calculationResults = numberOfStraws / numberOfDivisors
        } else {
            isShowingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
