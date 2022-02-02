//
//  CustomTabbarView.swift
//  LJIdleFish
//
//  Created by lujun on 2022/2/1.
//

import SwiftUI
import SDWebImageSwiftUI
var randomColor: Color {
    let r = arc4random_uniform(UInt32(255.0))
    let g = arc4random_uniform(UInt32(255.0))
    let b = arc4random_uniform(UInt32(255.0))
  return  Color(.sRGB, red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0, opacity: 1.0)
}
//自定义tabBar
struct CustomTabbarView: View {
    var safeEdgeInsets: EdgeInsets
    @Binding var currentTab: CustomTabbar
    var body: some View {
        
            HStack(spacing: 0){
                ForEach(CustomTabbar.allCases,id:\.rawValue){ item in
                    Button(action: {
                        currentTab = item
                    }, label: {
                        VStack{
//                            Image(currentTab == item ? item.selIconName : item.norIconName)
                            
                            if currentTab == item {
                                AnimatedImage(name: "tabbar_animation.gif")
                                    .customLoopCount(1)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    
                                    .frame(width: 35, height: 35)
                            }else{
                                Image(item.norIconName)
                            }
                            
                            Text(item.rawValue)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color.black.opacity(currentTab == item ? 0.8 : 0.3))
                        }
                    })
                        .frame(maxWidth: .infinity)
                    
                    if item == .niceplay {
                        Button {
                            
                        } label: {
                            Image("tabbar_post_idle")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 75, height: 75)
                            
                            
                        }
                        .offset(y: -10)
                        
                    }
                    
                }
                
                
            }
            .padding(.top,20)
            .padding(.bottom,safeEdgeInsets.bottom == 0 ? 10 : safeEdgeInsets.bottom )
            .background(Color.white.clipShape(CustomTabbarBackgoundShap()))
            //        .background(Color.orange)
           /* .background(
                    
                Canvas{context,size in
                    context.fill(Path { path in
                        let width = size.width
                        let _ = size.height
                        let midWidth = width * 0.5
                        path.move(to: CGPoint(x: 0, y: 20))
                        
                        path.addLine(to: CGPoint(x: midWidth - 55, y: 20))
                        path.addCurve(to: CGPoint(x: midWidth, y: 0), control1: CGPoint(x: midWidth - 35, y: 20), control2: CGPoint(x: midWidth - 25, y: 0))
                      
                        path.addCurve(to: CGPoint(x: midWidth + 55, y: 20), control1: CGPoint(x: midWidth + 25, y: 0), control2: CGPoint(x: midWidth + 35, y: 20))
                        
                        path.addLine(to: CGPoint(x: size.width, y: 20))
                        path.addLine(to: CGPoint(x: size.width, y: size.height))
                        path.addLine(to: CGPoint(x: 0, y: size.height))
                        
                        
                    },with: .color(.white)
                    )
                    
                }

            )
            */
            
       
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
//        CustomTabbarView(currentTab: .constant(CustomTabbar(rawValue: "闲鱼")!))
//
        CustomTabbarView(safeEdgeInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0), currentTab: .constant(.home))
        

        
    }
}

enum CustomTabbar: String,CaseIterable{
    case home = "闲鱼"
    case niceplay = "会玩"
    case message = "消息"
    case mine = "我的"
    var iconName: String {
        switch self {
        case .home:
            return "tabbar_home"
        case .niceplay:
            return "tabbar_niceplay"
        case .message:
            return "tabbar_message"
        case .mine:
            return "tabbar_mine"
        }
    }
    
    var norIconName: String {
        iconName + "_nor"
    }
    var selIconName: String {
        iconName + "_sel"
    }
    
}


struct CustomTabbarBackgoundShap: Shape{
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        let midWidth = width * 0.5
        return Path{ path in
         
            path.move(to: CGPoint(x: 0, y: 20))
            
            path.addLine(to: CGPoint(x: midWidth - 55, y: 20))
            path.addCurve(to: CGPoint(x: midWidth, y: 0), control1: CGPoint(x: midWidth - 35, y: 20), control2: CGPoint(x: midWidth - 25, y: 0))
          
            path.addCurve(to: CGPoint(x: midWidth + 55, y: 20), control1: CGPoint(x: midWidth + 25, y: 0), control2: CGPoint(x: midWidth + 35, y: 20))
            
            path.addLine(to: CGPoint(x: width, y: 20))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            
        }
    }
}
