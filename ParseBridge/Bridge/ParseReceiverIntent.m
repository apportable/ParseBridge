#import "ParseReceiverIntent.h"

#import <UIKit/UIApplication.h>

@implementation ParseReceiverIntent

+ (void)initializeJava
{
    [super initializeJava];

    // non-object-method callback is JNI C function whose name takes the form:
    // ... JAVA_com_example_YourClassName_yourPrivateStaticMethod(JNIEnv *env, jclass clazz, ...)
}

+ (NSString *)className
{
    return @"com.parsebridge.ParseReceiverIntent";
}

@end

VERDE_EXPORT_API void Java_com_parsebridge_ParseReceiverIntent_forwardRemoteNotification(JNIEnv *env, jclass clazz, jstring payload)
{
    NSString *string = [[NSString alloc] initWithJavaString:payload];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSDictionary *userInfo = [string DCF_JSONValue];
        id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
        if ([delegate respondsToSelector:@selector(application:didReceiveRemoteNotification:)])
        {
            [delegate application:[UIApplication sharedApplication] didReceiveRemoteNotification:userInfo];
        }
        [string release];
    });
}
