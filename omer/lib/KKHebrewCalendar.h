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

/**
 * Date calendar 
 * 
 */
@interface KKHebrewCalendar : NSObject


/**
 * returns a range of Hebrew years for a Gregorian year
 *
 * @param year Gregorian year
 * @return range of Hebrew years
 * 
 */
- (NSRange)yearsRangeForYear:(NSUInteger)year;

/**
 * returns a Hebrew date from a Gregorian date
 *
 * @param date Gregorian date
 * @return Hebrew date
 * 
 */
- (NSDate*)convertHebrewDateWithDate:(NSDate*)date;


/**
 * returns a Gregorian date from Heberew Date
 *
 * @param hebrewDate Hebrew date
 * @return Gregorian date
 * 
 */
- (NSDate*)convertDateWithHebrewDate:(NSDate*)hebrewDate;


@end
