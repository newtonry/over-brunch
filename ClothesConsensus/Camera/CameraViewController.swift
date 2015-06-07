//
//  CameraViewController.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 6/6/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit
import AVFoundation
import AssetsLibrary


class CameraViewController: BaseViewController {

    @IBOutlet weak var picturePreviewView: UIView!
    
    let captureSession = AVCaptureSession()
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    var cameras: [AVCaptureDevice] = [AVCaptureDevice]()
    var captureDeviceInput: AVCaptureDeviceInput?
    
    
    override func viewDidLoad() {
        findCameras()
        setupCameraPreview()
    }
    
    func setupCameraPreview() {
        if cameras.count > 0 {
            println("We're ready to roll")
            captureDeviceInput = AVCaptureDeviceInput(device: cameras[0], error: nil)
            
            captureSession.addInput(captureDeviceInput)
            let cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            let previewLayerFrame = picturePreviewView.layer.frame
            // For some reason I have to set the height and width of the layer this way. I think that the autolayout of the preview UIView confuses it
            cameraPreviewLayer.frame = CGRectMake(previewLayerFrame.origin.x, 0, view.frame.width, view.frame.width)
            
            cameraPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            self.view.layer.addSublayer(cameraPreviewLayer)
            
            captureSession.startRunning()
        }
    }
    
    @IBAction func flipCamera(sender: UIButton) {
        let oldCamera = cameras[0]
        captureSession.removeInput(captureDeviceInput)
        
        cameras.removeAtIndex(0)
        cameras.append(oldCamera)
        
        if let sublayer = cameraPreviewLayer {
            sublayer.removeFromSuperlayer()
        }
        setupCameraPreview()
    }
    
    @IBAction func flashSwitch(sender: UIButton) {
        
        
    }
    
//    NOT SURE IF THIS IS THE RIGHT WAY TO DO IT. MAY NEED TO LOOK INTO UIIMAGEPICKER A BIT MORE
    @IBAction func takePhoto(sender: UIButton) {
//        var imageOutput: AVCaptureStillImageOutput = AVCaptureStillImageOutput()
//        imageOutput.captureStillImageAsynchronouslyFromConnection(imageOutput.connectionWithMediaType(AVMediaTypeVideo)) {
//            (imageDataSampleBuffer, error) -> Void in
//            
//            if let imageDataSampleBuffer = imageDataSampleBuffer {
//                let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataSampleBuffer)
//                println("got image data:")
//                if let image = UIImage(data: imageData) {
//                    println("CAM-CONTROLLER: inside captureImageNow -- set the image: \(image)")
//                    
////                    self.cameraPreviewContainer.image = image
//                    
//                    
//                    
//                    //save the image to library
//                    let library = ALAssetsLibrary()
//                    library.writeImageDataToSavedPhotosAlbum(imageData, metadata: nil, completionBlock: nil)
//                    
//                    println("The photo has been saved!")
//                }
//            }
//        }
    }

    
    
    
    func findCameras() {
//        TODO this should probably be a helper function outside. Maybe even have a camera manager module.
        let devices = AVCaptureDevice.devices()
        for device in devices {
            if (device.hasMediaType(AVMediaTypeVideo)) {
                cameras.append(device as AVCaptureDevice)
            }
        }
    }
    
    @IBAction func exitButtonPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}