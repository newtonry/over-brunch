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
        let camera = cameras[0]

        if !camera.isFlashModeSupported(AVCaptureFlashMode.On) {
            return
        }
        
        camera.lockForConfiguration(nil)
        
        if camera.flashMode == AVCaptureFlashMode.Off {
            camera.flashMode = AVCaptureFlashMode.On
            println("Flash is on")
        } else if camera.flashMode == AVCaptureFlashMode.On {
            camera.flashMode = AVCaptureFlashMode.Off
            println("Flash is off")
        }
    }
    
//    NOT SURE IF THIS IS THE RIGHT WAY TO DO IT. MAY NEED TO LOOK INTO UIIMAGEPICKER A BIT MORE
    @IBAction func takePhoto(sender: UIButton) {
        var output = AVCaptureStillImageOutput()
        captureSession.addOutput(output)
        
        
        output.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]

        output.captureStillImageAsynchronouslyFromConnection(output.connectionWithMediaType(AVMediaTypeVideo), completionHandler: {(imageBuffer, error) -> Void in
            
            let imageDataJpeg = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageBuffer)
            var pickedImage: UIImage = UIImage(data: imageDataJpeg)!
                self.picturePreviewView.addSubview(UIImageView(image: pickedImage))
            
                let photoPostViewController = ViewControllers.photoPostViewController() as PhotoPostViewController
                photoPostViewController.photo = pickedImage
            
                self.navigationController!.presentViewController(photoPostViewController, animated: true, completion: nil)
            
            
            }
        
            
        )
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
