//
//  LikeAnimation.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 19/06/1445 AH.
//

import Lottie
import SwiftUI
import Foundation

struct LikeAnimation: UIViewRepresentable {


    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "likeAnimation")
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}
