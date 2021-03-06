////////////////////////////////////////////////////////////////////////////////
//
//  TYPHOON FRAMEWORK
//  Copyright 2013, Jasper Blues & Contributors
//  All Rights Reserved.
//
//  NOTICE: The authors permit you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

#import "PFThemeProvider.h"
#import "PFThemeFactory.h"
#import "PFTheme.h"
#import "UIColor+CKUITools.h"

/**
* This assembly illustrates the use of factory-components & collections.
*/
@implementation PFThemeProvider

/**
* Current-theme is emitted from the theme-factory, which increments the theme on each run of the application.
*/
- (id)currentTheme
{
    return [TyphoonDefinition withClass:[PFTheme class] configuration:^(TyphoonDefinition* definition)
    {
        [definition useInitializer:@selector(sequentialTheme)];
        definition.factory = [self themeFactory];
    }];
}

/**
* The theme factory contains a collection of each theme. Individual themes are using Typhoon's type-converter system to convert the string
* representation of properties to their required runtime type. (This is particularly useful when using PropertyPlaceholder configs).
*/
- (id)themeFactory
{
    return [TyphoonDefinition withClass:[PFThemeFactory class] configuration:^(TyphoonDefinition* definition)
    {
        [definition injectProperty:@selector(themes) with:@[
            [self cloudsOverTheCityTheme],
            [self beachTheme],
            [self lightsInTheRainTheme],
            [self sunsetTheme]
        ]];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id)cloudsOverTheCityTheme
{
    return [TyphoonDefinition withClass:[PFTheme class] configuration:^(TyphoonDefinition* definition)
    {
        [definition injectProperty:@selector(backgroundResourceName) with:@"bg3.png"];
        [definition injectProperty:@selector(navigationBarColor) with:[UIColor colorWithHexRGB:0x641d23]];
        [definition injectProperty:@selector(forecastTintColor) with:[UIColor colorWithHexRGB:0x641d23]];
        [definition injectProperty:@selector(controlTintColor) with:[UIColor colorWithHexRGB:0x7f9588]];
    }];
}

- (id)lightsInTheRainTheme
{
    return [TyphoonDefinition withClass:[PFTheme class] configuration:^(TyphoonDefinition* definition)
    {
        [definition injectProperty:@selector(backgroundResourceName) with:@"bg4.png"];
        [definition injectProperty:@selector(navigationBarColor) with:[UIColor colorWithHexRGB:0xeaa53d]];
        [definition injectProperty:@selector(forecastTintColor) with:[UIColor colorWithHexRGB:0x722d49]];
        [definition injectProperty:@selector(controlTintColor) with:[UIColor colorWithHexRGB:0x722d49]];
    }];
}


- (id)beachTheme
{
    return [TyphoonDefinition withClass:[PFTheme class] configuration:^(TyphoonDefinition* definition)
    {
        [definition injectProperty:@selector(backgroundResourceName) with:@"bg5.png"];
        [definition injectProperty:@selector(navigationBarColor) with:[UIColor colorWithHexRGB:0x37b1da]];
        [definition injectProperty:@selector(forecastTintColor) with:[UIColor colorWithHexRGB:0x37b1da]];
        [definition injectProperty:@selector(controlTintColor) with:[UIColor colorWithHexRGB:0x0043a6]];
    }];
}


- (id)sunsetTheme
{
    return [TyphoonDefinition withClass:[PFTheme class] configuration:^(TyphoonDefinition* definition)
    {
        [definition injectProperty:@selector(backgroundResourceName) with:@"sunset.png"];
        [definition injectProperty:@selector(navigationBarColor) with:[UIColor colorWithHexRGB:0x0a1d3b]];
        [definition injectProperty:@selector(forecastTintColor) with:[UIColor colorWithHexRGB:0x0a1d3b]];
        [definition injectProperty:@selector(controlTintColor) with:[UIColor colorWithHexRGB:0x606970]];
    }];
}


@end