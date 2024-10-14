import SwiftUI

struct HomeView: View {
    @State private var coinCount: Int = 100
    // 图片名称数组
    private let levelImages = ["kingdergartenTest","winter map end","level1", "level2", "level3", "level4"]
    // 锁定的关卡编号数组，表示这些关卡还未解锁
    @State private var lockedLevels = [2, 3, 4,5,6] // 假设2、3、4关卡锁定
    
    
    @State private var movetoWinterMap = false // 控制进入冬季地图的布尔值
    @State private var movetoKindergartenMap = false // 控制进入幼儿园地图的布尔值

 
    
    
    
    
    
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all) // 背景色覆盖整个屏幕
            
            VStack {
                // 顶部的设置和金币栏
                HStack {
                    
                    HStack(spacing: 5) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                        Text("\(coinCount)")
                            .font(.headline)
                    }//HStack end 左上角金币
                    
                    Spacer()

                    //右上的设置按钮操作
                    Button(action: {
                    }) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                    }
                }//HSTack end
                .padding(.horizontal)
                .padding(.top, 20)

                Text("地図を選びください！")
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    .foregroundColor(.blue)

                // 使用 ScrollView 和 ForEach 遍历图片数组
//                ScrollView(.horizontal,
//                    //.vertical,
//                    showsIndicators: false) {
//                    //VStack
//                    LazyHStack(spacing: 20) {
//                        ForEach(0..<levelImages.count, id: \.self) { index in
//                            ZStack {
//                                // 关卡图片
//                                Image(levelImages[index])
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 200)
//                                    .cornerRadius(10)
//                                    .shadow(radius: 5)
//
//                                
//                                // 判断是否锁定关卡
//                                if lockedLevels.contains(index + 1) {
//                                    // 使用圆形锁图标并设置为白色
//                                    Image(systemName: "lock.fill")
//                                        .resizable()
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(.black)
//                                } else {
//                                    // 显示开始按钮
//                                    Button(action: {
//                                        // 点击开始按钮的操作
//                                    }) {
//                                        HStack {
//                                            Image(systemName: "play.fill")
//                                                .foregroundColor(.white)
//                                            Text("开始")
//                                                .foregroundColor(.white)
//                                                .font(.headline.weight(.bold))
//                                        }
//                                        .padding(.horizontal, 20)
//                                        .padding(.vertical, 10)
//                                        .background(Color.green)
//                                        .cornerRadius(20)
//                                    }
//                                    .position(x: UIScreen.main.bounds.width / 2, y: 160)
//                                }
//                            }//ZStack end
//                        }
//                    }
//                    .padding(.horizontal)
//                }//ScrollView end

        //👇测试图片按钮
                // 使用 ScrollView 和 ForEach 遍历图片数组
                ScrollView(.horizontal,
                    //.vertical,
                    showsIndicators: false) {
                    //VStack
                    LazyHStack(spacing: 20) {
                        
                        
                        Button(action:{
                            movetoWinterMap = true
                            //点击后发生的动作
                        }){
                            Image(uiImage:UIImage(named:"winter map end")!)
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(width:350,height:200)
                        }
                        
                        Button(action:{
                            movetoKindergartenMap = true
                            //点击后发生的动作
                        }){
                            Image(uiImage:UIImage(named:"kingdergartenTest")!)
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(width:330,height:180)
                        }
                      
                        Button(action:{
                            //点击后发生的动作
                        }){
                            Image(uiImage:UIImage(named:"level1")!)
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(width:330,height:180)
                        }
                        
                        Button(action:{
                            //点击后发生的动作
                        }){
                            Image(uiImage:UIImage(named:"level2")!)
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(width:330,height:180)
                        }
                        
                        
                        
                        
                        ForEach(0..<levelImages.count, id: \.self) { index in
                            ZStack {
                                // 关卡图片
                                Image(levelImages[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)

                                
                                // 判断是否锁定关卡
                                if lockedLevels.contains(index + 1) {
                                    // 使用圆形锁图标并设置为白色
                                    Image(systemName: "lock.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.black)
                                } else {
                                    // 显示开始按钮
                                    Button(action: {
                                        // 点击开始按钮的操作
                                    }) {
                                        HStack {
                                            Image(systemName: "play.fill")
                                                .foregroundColor(.white)
                                            Text("开始")
                                                .foregroundColor(.white)
                                                .font(.headline.weight(.bold))
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(Color.green)
                                        .cornerRadius(20)
                                    }
                                    .position(x: UIScreen.main.bounds.width / 2, y: 160)
                                }
                            }//ZStack end
                        }//foreach循环 end
                    }//LazyHStack end
                    .padding(.horizontal)
                }//ScrollView end
                //👆测试图片按钮
                
                
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .bottom) // 忽略底部安全区域
        
        .fullScreenCover(isPresented: $movetoWinterMap) {
            WinterMapView()
        }
        .fullScreenCover(isPresented: $movetoKindergartenMap) {
            kingdergartenMapView()
        }
        
    }//var body end
}

#Preview {
    HomeView()
}
