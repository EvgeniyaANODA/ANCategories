ANCategories
============

For using font category, add to your global header, just before import category next lines and specify your own font names;
For discover font names by group, please use nex code

```
[[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
    NSLog (@"%@: %@", obj, [UIFont fontNamesForFamilyName:obj]);
}];
```


```
static NSString* const kANUltraLightFontName = @"";
static NSString* const kANLightFontName = @"";
static NSString* const kANMediumFontName = @"";
static NSString* const kANNormalFontName = @"";
static NSString* const kANSemiboldFontName = @"";
static NSString* const kANBoldFontName = @"";
```
