# ImageEditorPro

Image Editor Plugin with simple, easy support for image editing using Paints, Text, Filters, Emoji and Sticker like stories.

## Getting Started

To start with this, we need to simply add the dependencies in the gradle file of our app module like this

Import

```dart
import 'package:image_editor_pro/image_editor_pro.dart';
```

Add this function to Your StateFull Widget Check the [Example](https://github.com/zeeshux7860/Image_editor_pro_package/blob/master/example/lib/main.dart)

```dart
 Future<void> getimageditor()  {
    final geteditimage =   Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return ImageEditorPro(
            appBarColor: Colors.blue,
            bottomBarColor: Colors.blue,
          );
        }
    )).then((geteditimage){
      if(geteditimage != null){
        setState(() {
          _image =  geteditimage;
        });
      }
    }).catchError((er){print(er);});

  }
```



## Credits
- This project is inspired from [PhotoEditor by Burhanuddin Rashid](https://github.com/burhanrashid52/PhotoEditor)

Thanks to [Get Emoji](https://getemoji.com/) for Emoji's

## MIT License

Copyright (c) 2019 Zeeshan & Sanskar 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
