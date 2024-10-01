//
//  OpenView.swift
//  FindOutApp
//
//  Created by cmStudent on 2024/10/1.
//

import SwiftUI


struct OpenView: View {
    @State private var isActive = false // 用于控制导航到下一个页面

    var body: some View {
        NavigationView {
            VStack {
                Image("openimage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // 保证图片完整显示，占据整个屏幕
                    .edgesIgnoringSafeArea(.all) // 忽略安全区域
            }
            .background(Color.black) // 整个屏幕背景为黑颜色
            .onAppear {
                // 4秒后导航到LoadingView
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
//            .background(
//                NavigationLink(
//                    destination: LoadingView(),
//                    isActive: $isActive,
//                    label: { EmptyView() }
//                )
//            )
        }
//        .fullScreenCover(isPresented: 
    }
}

#Preview {
    OpenView()
}
