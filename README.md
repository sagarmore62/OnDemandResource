## OnDemandResource

Alongside iOS 9 and watchOS 2, Apple introduced on-demand resources, a new API for delivering content to your applications while also reducing the amount of space the application takes up on the user's device. With on-demand resources, you can tag specific assets of your application, have them hosted on Apple's servers, allowing your users to download them when needed. In this demo, I am going show you the basics of on-demand resources by creating a basic image viewer application.


# Benefits
On-demand resources were introduced in iOS 9 and watchOS 2 for the main purpose of reducing the amount of space individual apps take up on a device. Another important advantage of on-demand resources is that your app can be downloaded and opened by users much quicker.

On-demand resources work by assigning unique tags to resources within Xcode to create what's called an asset pack. These packs can include anything from asset catalogs (images, SpriteKit textures, data, etc.) or even just other files, such as OpenGL and Metal shaders as well as SpriteKit and SceneKit scenes and particle systems.

When you submit your app to the App Store, these resources are also uploaded and are hosted there in order to be downloaded at any time. To download asset packs at runtime in an app, you simply use the tag for each pack that you assigned in Xcode.

# Limits
Apps that are built with support for on-demand resources must also stick to the following limits with regards to file size:

2GB for the iOS app bundle
2GB for the initial install tags
2GB for the prefetched tags
2GB for in-use resources. This is only important when your application is running and using on-demand resources.
512MB for each individual asset pack. No single tag can contain more than this amount of data. If you go over this limit, Xcode will give you a warning and will allow you to still test and develop your app. Any submission attempts to the App Store, however, will fail.
20GB for all the resources hosted by Apple. This is the total amount of resources your app can possibly download at any one time. While only 2GB can be used at any one time, if a user's device has enough storage, up to 20GB of your resources can be downloaded and made accessible to your app at any time.

# Notes :
 - This demo implemented with Xcode9 & iOS 11.
 - To see actual disk uses, check Disk Report in Xcode.
