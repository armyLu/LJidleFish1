//
//  ContentView.swift
//  LJIdleFish
//
//  Created by lujun on 2022/2/1.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: CustomTabbar = .home
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom){
                TabView(selection: $currentTab){
                    ForEach(CustomTabbar.allCases,id:\.rawValue){ item in
                        Text(item.rawValue)
                            .font(.system(size: 100)).bold()
                            .foregroundColor(randomColor)
                            .tag(item)
                            .frame(maxWidth: .infinity ,maxHeight: .infinity)
                            .background(randomColor)
                    }
                }
                CustomTabbarView(safeEdgeInsets: proxy.safeAreaInsets,currentTab: $currentTab)
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
