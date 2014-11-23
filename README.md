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
//light fonts
 NSString* const kANUltraLightFontName = @"";
 NSString* const kANThinFontName = @"";
 NSString* const kANLightFontName = @"";

//normal
 NSString* const kANRegularFontName = @"";
 NSString* const kANMediumFontName = @"";
//bold
 NSString* const kANSemiboldFontName = @"";
 NSString* const kANBoldFontName = @"";
//condensed
 NSString* const kANCondensedBlackFontName = @"";
 NSString* const kANCondensedBoldFontName = @"";

//italic
//light fonts
 NSString* const kANItalicUltraLightFontName = @"";
 NSString* const kANItalicThinFontName = @"";
 NSString* const kANItalicLightFontName = @"";

//normal
 NSString* const kANItalicRegularFontName = @"";
 NSString* const kANItalicMediumFontName = @"";
//bold
 NSString* const kANItalicSemiboldFontName = @"";
 NSString* const kANItalicBoldFontName = @"";
```
