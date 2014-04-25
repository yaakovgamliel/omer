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

#import <Foundation/Foundation.h>

enum {
  KKDateFormatterFullEnglishStyle = 0,  // full format of a English date
  KKDateFormatterFullHebrewStyle = 1  // full format of a Hebrew date
};
typedef NSUInteger KKDateFormatterStyle;




/**
 * Date formatter designed to format Hebrew dates.
 * 
 */
@interface KKDateFormatter : NSObject {
  KKDateFormatterStyle _dateStyle;
}


/**
 * Returns the date format string used by the receiver.
 * 
 * @return The date format string used by the receiver.
 */
- (KKDateFormatterStyle)dateStyle;

/**
 * Sets the date format for the receiver.
 * 
 * @param style The date format for the receiver.
 */
- (void)setDateStyle:(KKDateFormatterStyle)style;


/**
 * returns a string date from NSDate object.
 *
 * @param date date to be formatted.
 * @return formatted string.
 * 
 */
- (NSString*)stringFromDate:(NSDate*)date;




@end
