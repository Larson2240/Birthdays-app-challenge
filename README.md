Hey guys 👋
I hope everyone is doing great today! I'm just gonna go straight to your questions:

How to install and run the project:
You don't need anything special to install and run the project. Just clone the repo and run it on the Xcode simulator. 
I've used SPM for dependencies, so no additional setup, like for CocoaPods is required.

Reasoning behind your technical choices:
For UI I decided to use SwiftUI and Combine basically because I like them a lot.
They are easy to use, there are no headackes like with UIKit's @IBOutlets or other Interface Builder problems.
I could use UIKit, of course, but only if it was required.
Alamofire is a no-brainer for me. It's quick to setup and easy to work with, it helps us to reduce time when coding network layers or services.
Moya is a cool option too, but Alamofire is good enough in this case.
Also I added an offline mode using Code Data just in case user looses connection and wants to check something quickly.
Code should be bugs free and crash free. Other from that I don't think there is a lot to explain here, the task is pretty basic.

Describe any trade-offs you needed to make and your reasoning:
Some moments like checking wheter the object exists in the DB or not before saving it could be improved. Nothing is ideal of course. 
Also would be great to load that amount of objects using pagination because when we have 1000 names that's fine, but if we needed to load like 1000 images at once that would hurt the UX for sure. So in this case pagination is the way to go.

Point out anything you might do differently if you had more time:
Actually I did everything I wanted to do it, so I'm not sure I'd change anything.

Your contact details and any public profiles on developer networks like GitHub, BitBucket, Stack Overflow, etc:
I don't do open source and I'm usng my accounts on GitHub and BitBucket only for work related stuff, but if you need them anyways GitHub username is Larson2240 and BitBucket email is seraphimkovalchuk@gmail.com. Also I don't have a Stack Overflow account
