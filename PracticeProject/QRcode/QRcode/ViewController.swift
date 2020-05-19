//
//  ViewController.swift
//  QRcode
//
//  Created by 김지나 on 2020/05/19.
//  Copyright © 2020 김지나. All rights reserved.
// 참조 : https://nebori.tistory.com/28

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    // MARK: view cycle ----------------------------------
    override func viewDidDisappear(_ animated: Bool) {
        captureSession?.stopRunning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        captureSession?.startRunning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AVCaptureDevice를 통해 물리적 캡처 장치(우리의 경우 비디오)를 참조할 수 있음
        let captureDevice = AVCaptureDevice.default(for: .video)
        
        if let captureDevice = captureDevice {
            do {
                captureSession = AVCaptureSession()
                
                // CaptureSession에서 데이터를 캡처하려면 입력이 필요함
                let input = try AVCaptureDeviceInput(device: captureDevice)
                captureSession?.addInput(input)

                // CaptureSession는 출력 데이터 전송 대상이 필요함
                let captureMetadataOutput = AVCaptureMetadataOutput()
                
                // 출력부에 예상 메타 데이터 유형을 알린다.
                captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                captureMetadataOutput.metadataObjectTypes = [.code128, .qr, .ean8, .code39, .upce, .aztec, .pdf417]
                
                captureSession?.startRunning()
                
                // videoPreviewLayer = captureSession과 함께 비디오 표시
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.videoGravity = .resizeAspectFill
                videoPreviewLayer?.frame = view.layer.bounds
                view.layer.addSublayer(videoPreviewLayer!)
            } catch {
                print("error")
            }
        }
    }

    // MARK: AVCaptureMetadataOutputObjectsDelegate ---------------------------
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        DispatchQueue.main.sync {
            if metadataObjects.count == 0 {
                print("no object")
                return
            }
            
            let metaDataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            guard let stringCodeValue = metaDataObject.stringValue else { return }
            
            // transformatedMetaDataObject는 시각적 속성에서 도면층 좌표/높이/폭 반환
            guard let _ = self.videoPreviewLayer?.transformedMetadataObject(for: metaDataObject) else { return }
            
//            AudioServicesPlayAlertSound(self.systemSoundID)
//            if let url = URL(string: stringCodeValue) {
//                self.sendURL(url:url)
//            }

        }

    }

}

