RTFDiskCache
============

Drop-in utility for reading and writing NSObjects to disk

# Installation

    pod install RTFDiskCache

# Usage

Ensure that you're conforming to NSCoding in the NSObject subclass.

    [[RTFDiskCache sharedCache].objects addObject:someObject];
    [[RTFDiskCache sharedCache] save];
