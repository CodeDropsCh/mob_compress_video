#import "MobCompressVideoPlugin.h"
#import <mob_compress_video/mob_compress_video-Swift.h>

@implementation MobCompressVideoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMobCompressVideoPlugin registerWithRegistrar:registrar];
}
@end
