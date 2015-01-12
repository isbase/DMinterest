#import "UIDevice+machine.h"
#include <sys/types.h>
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/sysctl.h>
#include <mach/mach.h>
#import <AdSupport/AdSupport.h>

@implementation UIDevice(machine)

- (NSString *)machine {
    size_t size;
    
    // Set 'oldp' parameter to NULL to get the size of the data
    // returned so we can allocate appropriate amount of space
    sysctlbyname("hw.machine", NULL, &size, NULL, 0); 
    
    // Allocate the space to store name
    char *name = malloc(size);
    
    // Get the platform name
    sysctlbyname("hw.machine", name, &size, NULL, 0);
    
    // Place name into a string
    NSString *machine = [NSString stringWithCString:name encoding:[NSString defaultCStringEncoding]];
    
    // Done with this
    free(name);
    
    return machine;
}

- (NSString *)macaddress {
    //推广对接
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f ) {
      return [[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString;
    } else {
        int                 mib[6];
        size_t              len;
        char                *buf;
        unsigned char       *ptr;
        struct if_msghdr    *ifm;
        struct sockaddr_dl  *sdl;
        
        mib[0] = CTL_NET;
        mib[1] = AF_ROUTE;
        mib[2] = 0;
        mib[3] = AF_LINK;
        mib[4] = NET_RT_IFLIST;
        
        if ((mib[5] = if_nametoindex("en0")) == 0) {
            printf("Error: if_nametoindex error/n");
            return @"";
        }
        if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
            printf("Error: sysctl, take 1/n");
            return @"";
        }
        buf = malloc(len);
        if (buf == NULL) {
            printf("Could not allocate memory. error!/n");
            return @"";
        }
        if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
            printf("Error: sysctl, take 2");
            free(buf);
            return @"";
        }
        
        ifm = (struct if_msghdr *)buf;
        sdl = (struct sockaddr_dl *)(ifm + 1);
        ptr = (unsigned char *)LLADDR(sdl);
        // NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
        NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
        free(buf);
        return [outstring uppercaseString];
    }
}

- (double)currentMemoryUsage {
	vm_statistics_data_t vmStats;
	mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
	kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
	
	if(kernReturn == KERN_SUCCESS)
		return vmStats.wire_count/1024.0;
	else return 0;
}
@end
