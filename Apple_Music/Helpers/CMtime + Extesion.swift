//
//  CMtime + Extesion.swift
//  Apple_Music
//
//  Created by Антон on 14.02.2021.
//

import Foundation
import  AVKit

extension CMTime{
    
    func toDisplayString() -> String{
        guard !CMTimeGetSeconds(self).isNaN else {return ""}
        let totalSecond = Int(CMTimeGetSeconds(self))
        let second = totalSecond % 60
        let minutes = totalSecond / 60
        let timeStringFormat = String(format: "%02d:%02d", arguments: [minutes, second])
        return timeStringFormat
    }
}
