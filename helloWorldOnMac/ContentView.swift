//
//  ContentView.swift
//  helloWorldOnMac
//
//  Created by 山本祐太 on 2022/09/03.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var timerController =  TimerModel()
  @State var intervalMinute = 0 // タイマー時間(分)
  @State var intervalSecond = 0
  @State var value: Double = 0.0
  @State var progress: CGFloat = 0.0
  
  // デフォルト値の設定
  init() {
    _intervalMinute = State(initialValue: 2)
    _intervalSecond = State(initialValue: intervalMinute * 60)
    progress = timerController.progress
  }
  
  // 画面表示設定
  var body: some View {
    VStack(alignment: .center) {
      HStack(alignment: .center) {
        Button(action: {
          if (intervalMinute > 1) {
            intervalMinute -= 1
          }
        }) {
          Text("↓")
          .font(
            .system(size: 40, weight: .heavy, design: .rounded)
          )
          .frame(width: 80, height: 80)
          .foregroundColor(.blue)
        }
        .buttonStyle(PlainButtonStyle())
        
        Text(String(intervalMinute))
          .font(
            .system(size: 80, weight: .heavy, design: .rounded)
          )
        
        Text("min")
          .font(
            .system(size: 60, weight: .semibold,design: .rounded)
          )
        
        Button(action: {
          intervalMinute += 1
        }) {
          Text("↑")
          .font(
            .system(size: 40, weight: .heavy, design: .rounded)
          )
          .frame(width: 80, height: 80)
          .foregroundColor(.blue)
        }
        .buttonStyle(PlainButtonStyle())
      }
      .padding(
        EdgeInsets(top: 30, leading: 0, bottom: 15, trailing: 0)
      )
      
      Button(action: {
        if(timerController.timer == nil){
          intervalSecond = intervalMinute * 60
          timerController.start(Double(intervalSecond))
          withAnimation(.linear(duration: Double(intervalSecond))) {
              self.value = 1.0
          }
        }else{
          timerController.stop()
          self.value = 0.0
        }
      }) {
        Text("\((timerController.timer != nil) ? "Stop" : "(Re)Start")")
        .font(
          .system(size: 50, weight: .heavy, design: .rounded)
        )
        .frame(width: 300, height: 100)
        .foregroundColor(Color.white)
        .background(.blue)
        .cornerRadius(20)
      }
      .buttonStyle(PlainButtonStyle())
          VStack {
              Text("Remaining:")
                  .font(
                      .system(
                          size: 30,
                          weight: .heavy,
                          design: .rounded
                      )
                  )
              Text("\(timerController.countStr)")
                  .font(
                      .system(
                          size: 80,
                          weight: .heavy,
                          design: .rounded
                      )
                  )
              }
          .padding()
          VStack(alignment: .leading) {
              Text("Get Ready...")
                  .font(
                      .system(
                          size:25,
                          weight: .heavy,
                          design: .rounded
                      )
                  )
            SquareProgressView(progress: $timerController.progress, fullWidth: 400)
                .frame(width: 400, height: 20)
                .cornerRadius(10)
          }
    }
    .frame(
      width: 600,
      height: 600)
    .alert(isPresented: $timerController.showingAlert) {
      Alert(
        title: Text("JUST DO IT!!"),
        message: Text("とっとと次やれ！！"),
        dismissButton: .default(Text("OK"), action: { timerController.stop() })
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
