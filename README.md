JMPasswordView
==============

JMPasswordView is a GesturePassword view

How To Use It
==============

```cpp
#pragma mark - JMPasswordViewDelegate
-(void)JMPasswordView:(JMPasswordView *)passwordView withPassword:(NSString *)password{
    textLeb.text=password;
}
```

Attribute
==============
```cpp
#define jmPointRadius 30.0
#define jmPointBorderWidth 1.0
#define jmSmallPointRadius 6.0
#define jmPointLeftMargin 20.0
#define jmPointTopMargin 20.0
#define jmPointBetweenMargin 40.0
#define jmPathWidth 12.0
#define jmPasswordMinLength 4

#define jmPasswordPointColor [UIColor colorWithRed:50.0/255.0 green:200.0/255.0 blue:50.0/255.0 alpha:0.4]
#define jmPasswordPointBorderColor [UIColor grayColor]
#define jmPasswordSmallPointColor [UIColor colorWithRed:50.0/255.0 green:145/255.0 blue:60.0/255.0 alpha:1]
#define jmPasswordPointHighlightColor [UIColor orangeColor]
#define jmPasswordPointBorderHighlightColor [UIColor redColor]
#define jmPasswordSmallPointHighlightColor [UIColor colorWithRed:1 green:0.0 blue:0.0 alpha:1]
#define jmPasswordLineColor [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.4]
```
