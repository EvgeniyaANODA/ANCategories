ANCategories
============

For using font category, add to your global header, just before import category next lines and specify your own font names;
For discover font names by group, please use nex code

```
[[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
    NSLog (@"%@: %@", obj, [UIFont fontNamesForFamilyName:obj]);
}];
```

You can add only that font names, that you plan to use. Not nessesary add all.

```
#define kANLightFontName @"OpenSans-Light"
#define kANRegularFontName @"OpenSans"
#define kANSemiboldFontName @"OpenSans-Semibold"
```

```
//light fonts
kANUltraLightFontName = @"";
kANThinFontName = @"";
kANLightFontName = @"";

//normal
kANRegularFontName = @"";
kANMediumFontName = @"";
//bold
kANSemiboldFontName = @"";
kANBoldFontName = @"";
//condensed
kANCondensedBlackFontName = @"";
kANCondensedBoldFontName = @"";

//italic
//light fonts
kANItalicUltraLightFontName = @"";
kANItalicThinFontName = @"";
kANItalicLightFontName = @"";

//normal
kANItalicRegularFontName = @"";
kANItalicMediumFontName = @"";
//bold
kANItalicSemiboldFontName = @"";
kANItalicBoldFontName = @"";
```
