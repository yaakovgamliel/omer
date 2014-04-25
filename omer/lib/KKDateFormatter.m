//
// Copyright 2011 Kosher Penguin LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "KKDateFormatter.h"
#import <Foundation/Foundation.h>

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation KKDateFormatter


///////////////////////////////////////////////////////////////////////////////////////////////////
- (KKDateFormatterStyle)dateStyle {
  return _dateStyle;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDateStyle:(KKDateFormatterStyle)style {
  _dateStyle = style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)stringFromDate:(NSDate*)date {

  NSString* localeString;
  
  if (_dateStyle==KKDateFormatterFullHebrewStyle) {
    localeString = @"he";
  } else {
    localeString = @"en";
  }
  
  NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:localeString];
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateStyle:NSDateFormatterLongStyle];
  [dateFormatter setCalendar:hebrewCalendar];   
  [dateFormatter setLocale:locale];

  
  NSString *formattedHebrewDateString = [dateFormatter stringFromDate:date];
  
  
  if (_dateStyle==KKDateFormatterFullHebrewStyle) {
    // years
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5769" 
                                                                                     withString:@"תשס\"ט"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5770" 
                                                                                     withString:@"תשֿ\"ע"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5771" 
                                                                                     withString:@"תשע\"א"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5772" 
                                                                                     withString:@"תשע\"ב"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5773" 
                                                                                     withString:@"תשע\"ג"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5774" 
                                                                                     withString:@"תשע\"ד"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5775" 
                                                                                     withString:@"תשע\"ה"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5776" 
                                                                                     withString:@"תשע\"ו"];
    
    // days
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"31" 
                                                                                     withString:@"ל\"א"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"30" 
                                                                                     withString:@"ל'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"29" 
                                                                                     withString:@"כ\"ט"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"28" 
                                                                                     withString:@"כ\"ח"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"27" 
                                                                                     withString:@"כ\"ז"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"26" 
                                                                                     withString:@"כ\"ו"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"25" 
                                                                                     withString:@"כ\"ה"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"24" 
                                                                                     withString:@"כ\"ד"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"23" 
                                                                                     withString:@"כ\"ג"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"22" 
                                                                                     withString:@"כ\"ב"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"21" 
                                                                                     withString:@"כ\"א"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"20" 
                                                                                     withString:@"כ'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"19" 
                                                                                     withString:@"יֿ\"ט"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"18" 
                                                                                     withString:@"יֿ\"ח"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"17" 
                                                                                     withString:@"יֿ\"ז"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"16" 
                                                                                     withString:@"ט\"ז"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"15" 
                                                                                     withString:@"ט\"ו"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"14" 
                                                                                     withString:@"יֿ\"ד"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"13" 
                                                                                     withString:@"יֿ\"ג"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"12" 
                                                                                     withString:@"יֿ\"ב"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"11" 
                                                                                     withString:@"יֿ\"א"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"10" 
                                                                                     withString:@"י'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"9" 
                                                                                     withString:@"ט'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"8" 
                                                                                     withString:@"ח'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"7" 
                                                                                     withString:@"ז'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"6" 
                                                                                     withString:@"ו'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"5" 
                                                                                     withString:@"ה'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"4" 
                                                                                     withString:@"ד'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"3" 
                                                                                     withString:@"ג'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"2" 
                                                                                     withString:@"ב'"];
    formattedHebrewDateString = [formattedHebrewDateString stringByReplacingOccurrencesOfString:@"1" 
                                                                                     withString:@"א'"];
    
  }
  
  return formattedHebrewDateString;
}



@end
