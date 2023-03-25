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
    @State private var calculationResults: String = "0.5"
    @State private var isShowingAlert: Bool = false
    @State private var alertMessage: String = ""

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
                    print("計算結果\(calculationResults)")
                } label: {
                    HStack {
                        Text("計算")
                    }
                }
                HStack {
                    Text(calculationResults)
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
        } message: {
            Text("\(alertMessage)")
        }
    }

    private func didTapAction(leftText: String, rightText: String) {
        guard let numberOfStraws = Double(leftText) else {
            isShowingAlert = true
            alertMessage = "割られる数を入力してください"
            return
        }
        guard let numberOfDivisors = Double(rightText) else {
            isShowingAlert = true
            alertMessage = "割る数を入力してください"
            return
        }
        if numberOfDivisors == 0 {
            isShowingAlert = true
            alertMessage = "割る数には0を入力しないでください"
        } else {
            // 表示桁数の制限は NumberFormatter で行う
            let formatter = NumberFormatter()
            // 10進数に設定
            formatter.numberStyle = .decimal
            formatter.minimumIntegerDigits = 1
            formatter.maximumFractionDigits = 5
            calculationResults = formatter.string(from: NSNumber(value: numberOfStraws / numberOfDivisors)) ?? ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
