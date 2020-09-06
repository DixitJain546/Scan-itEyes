# Scan-it Eyes Android application

## Overview

This is an example application for detecting the objet and providing information regarding survival time of Covid-19 virus on it.
It uses [Image classification](https://www.tensorflow.org/lite/models/image_classification/overview)
to continuously classify whatever it sees from the device's back camera.
Inference is performed using the TensorFlow Lite Java API. The demo app
classifies frames in real-time, displaying the top most probable
classifications.
Just face your camer towards the object and tap on the detected object's name it will provide you with the information.
There you will find list in card format, this is the list of materials that can be used to make that object.
You can click on any of the card and you will get information regarding that maetrial. 

### Model

Currently we have trained image model for five objects only.
This app can detect Remote Controllers, Currency Notes, Coins, Carton Boxes, and Door Knobs and Handles.

## Database
This app retrieves data from a MySQL Database.

## REST API
The APIs to link app with the database are created using PHP.

## Requirements

*  A decive with Android 5.0 or newer (Lollipop), working Camera and Proper Internet.

# Icons
Icons by Icon8 and flaticon.com
