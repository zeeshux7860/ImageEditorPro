#import "ImageEditorProPlugin.h"
#if __has_include(<image_editor_pro/image_editor_pro-Swift.h>)
#import <image_editor_pro/image_editor_pro-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "image_editor_pro-Swift.h"
#endif

@implementation ImageEditorProPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImageEditorProPlugin registerWithRegistrar:registrar];
}
@end
