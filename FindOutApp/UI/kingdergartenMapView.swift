//
//  kingdergartenMapView.swift
//  FindOutApp
//
//  Created by cmStudent on 2024/10/14.
//

import SwiftUI

struct kingdergartenMapView: View {
    
    @State var showkid1=true
    @State var showkid2=true
    @State var showkid3=true
    @State var showkid4=true
    @State var showkid5=true
    @State var showkid6=true
    
    
    
    @State var count : Double=0.0 //更新进度条
    @State var showAnimation=false//3D动画状态布尔值
    @State var animation=0.0//创建变量储存旋转角度

    //获取动画发生位置坐标
    @State private var Position:CGPoint = CGPoint(x:0,y:0)
    //更新动画发生位置的暂存变量
    @State private var x:CGFloat=0
    @State private var y:CGFloat=0
    
    //计算偏移量用来计算移动后的当前画面
    @State private var defaultOffset: CGSize = .zero
    @GestureState private var dragOffset: CGSize = .zero
    //缩放比例
    @State private var defaultScale: CGFloat = 1.0
    @GestureState private var dragScale: CGFloat = 1.0
    //itemBarSize
    @State private var itemBarOpacity:CGFloat = 1.0
    @State var itemBarButton = false
    
var body: some View {
        ZStack {
            Image("kingdergartenMap")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(x: defaultOffset.width + dragOffset.width,y: defaultOffset.height + dragOffset.height)
        
            //kid1
            if(showkid1){
                Button(
                    action: {showkid1.toggle()
                        x=defaultOffset.width + dragOffset.width+255
                        y=defaultOffset.height + dragOffset.height+44
                        showAnimation = true
                        coinAnimation()
                        count+=1
                    }, label: {
                        Image("kid1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 12,height: 28)
                            .clipped()
                    })
                .offset(x: defaultOffset.width + dragOffset.width+255,y: defaultOffset.height + dragOffset.height+44)
                
            }//if end
        
            //kid2
            if(showkid2){
                Button(
                    action: {showkid2.toggle()
                        
                        showAnimation = true
                        coinAnimation()
                        count+=1
                        x=defaultOffset.width + dragOffset.width+385
                        y=defaultOffset.height + dragOffset.height+72
                    }, label: {
                        Image("kid2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25,height: 43)
                            .clipped()
                    })
                .offset(x: defaultOffset.width + dragOffset.width+385,y: defaultOffset.height + dragOffset.height+72)
            }//if end
            
            
            //kid3
            if(showkid3){
                Button(
                    action: {showkid3.toggle()
                        
                        showAnimation = true
                        coinAnimation()
                        count+=1
                        x=defaultOffset.width + dragOffset.width+250
                        y=defaultOffset.height + dragOffset.height+190
                    }, label: {
                        Image("kid3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30,height: 55)
                            .clipped()
                    })
                .offset(x: defaultOffset.width + dragOffset.width+250,y: defaultOffset.height + dragOffset.height+190)
            }//if end
            
            
            //kid4
            if(showkid4){
                Button(
                    action: {showkid4.toggle()
                        showAnimation = true
                        x=defaultOffset.width + dragOffset.width-50
                        y=defaultOffset.height + dragOffset.height+130
                        coinAnimation()
                        count+=1}, label: {
                            Image("kid4")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20,height: 40)
                                .clipped()
                        })
                .offset(x: defaultOffset.width + dragOffset.width-50,y: defaultOffset.height + dragOffset.height+130)
            }//if end
            
            
            //kid5
            if(showkid5){
                Button(
                    action: {showkid5.toggle()
                        x=defaultOffset.width + dragOffset.width-280
                        y=defaultOffset.height + dragOffset.height-100
                        showAnimation = true
                        coinAnimation()
                        count+=1
                    }, label: {
                        Image("kid5")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35,height: 55)
                            .clipped()
                    })
                
                .offset(x: defaultOffset.width + dragOffset.width-280,y: defaultOffset.height + dragOffset.height-100)
            }//if end
            
            
            //kid6
            if(showkid6){
                Button(
                    action: {showkid6.toggle()
                        x=defaultOffset.width + dragOffset.width+160
                        y=defaultOffset.height + dragOffset.height+125
                        showAnimation = true
                        coinAnimation()
                        count+=1
                    }, label: {
                        Image("kid6")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40,height: 60)
                            .clipped()
                    })
                
                .offset(x: defaultOffset.width + dragOffset.width+160,y: defaultOffset.height + dragOffset.height+125)
            }//if end
            
            
            //圆形进度条
            Gauge(value: count, in: 0...5){
                Text("\(Int(count))/6")
            }
        .gaugeStyle(.accessoryCircularCapacity)
        .progressViewStyle(.linear)
        .tint(.blue)
        .background(.white)
        .cornerRadius(35)
        .offset(x:-UIScreen.main.bounds.width/2 + 50,y:-UIScreen.main.bounds.height/4 - 20)
            //进度条结束
            
            //3D动画旋转效果(旋转角度设定)
            if(showAnimation){
                Image("gold")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .rotation3DEffect(
                        .degrees(animation),axis: (x: 0.0, y: 1.0, z: 0.2)
                    )
                    .onAppear {
                        withAnimation(.interpolatingSpring(stiffness: 20, damping: 5)){
                            self.animation+=360
                        }
                    }
                 //获取按钮位置坐标的传值（动画发生的位置）
                    .offset(x:x,y:y)
            }//if end 动画启动判断
            
            //道具栏
            VStack {
                if itemBarButton {
                    Button(action: {
                        itemBarOpacity = 1.0
                        itemBarButton = false
                    }) {
                        Text("表示")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .background(.white)
                            .cornerRadius(10)
                    }
                }
                Button(action: {
                    itemBar()
                }) {
                    ItemListView()
                        .padding(.horizontal,5)
                        .padding(.vertical,10)
                        .background(.green)
                        .cornerRadius(50)
                        .opacity(itemBarOpacity)
                }
            }//VStack end
            .position(x:UIScreen.main.bounds.width - 50,y:UIScreen.main.bounds.height/2)
        }//ZStack end
        .gesture(
            SimultaneousGesture (
                DragGesture ()
                    .updating($dragOffset) { value, move, _ in
                        move = value.translation
                    }
                    .onEnded { value in
                        defaultOffset.width += value.translation.width
                        defaultOffset.height += value.translation.height
                    },
                MagnificationGesture()
                    .updating($dragScale) { value, scale, _ in
                        scale = value
                    }
                    .onEnded { value in
                        defaultScale *= value
                    }
            )
        )//gesture end
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .scaledToFill()
        .scaleEffect(defaultScale * dragScale)

    }//var body end
    
    //3D动画启动函数（1秒消失）
    func coinAnimation(){
        if(showAnimation){
            Task{
                try? await Task.sleep(nanoseconds: 1*1000000000)
                showAnimation = false
            }
        }
    }//function animation end
    
    private func itemBar() {
            itemBarOpacity = 0.0
            itemBarButton = true
    }
}//struct kingdergartenMapView end

#Preview {
    kingdergartenMapView()
}
