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

#import "KKHebrewCalendar.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation KKHebrewCalendar


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSRange)yearsRangeForYear:(NSUInteger)year {
  
  NSCalendar* gergorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  NSCalendar* hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
  
	NSUInteger dateUnits = NSYearCalendarUnit;
	// first day
	NSDateComponents *firstDayComponents = [[NSDateComponents alloc] init];
	[firstDayComponents setDay:1];
	[firstDayComponents setMonth:1];
	[firstDayComponents setYear:year];
	
	NSDate *firstDayDate = [gergorianCalendar dateFromComponents:firstDayComponents];
	NSDateComponents *firstJewishDateComponents = [hebrewCalendar components:dateUnits fromDate:firstDayDate];
	NSUInteger firstJewishDateYear = [firstJewishDateComponents year];
	
	// last day
	NSDateComponents *lastDayComponents = [[NSDateComponents alloc] init];
	[lastDayComponents setDay:31];
	[lastDayComponents setMonth:12];
	[lastDayComponents setYear:year];
	
	NSDate *lastDayDate = [gergorianCalendar dateFromComponents:lastDayComponents];
	
	NSDateComponents *lastJewishDateComponents = [hebrewCalendar components:dateUnits fromDate:lastDayDate];
	NSUInteger lastJewishDateYear = [lastJewishDateComponents year];
  
  NSRange range = NSMakeRange(firstJewishDateYear, lastJewishDateYear - firstJewishDateYear);
  
  return range;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDate*)convertHebrewDateWithDate:(NSDate*)date {
  NSCalendar* gergorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  NSCalendar* hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];

	NSUInteger dateUnits = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
	
	NSDateComponents *dateComponents = [hebrewCalendar components:dateUnits fromDate:date];
	NSDate *hebrewDate = [gergorianCalendar dateFromComponents:dateComponents];

  return hebrewDate;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDate*)convertDateWithHebrewDate:(NSDate*)hebrewDate {
  NSCalendar* gergorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  NSCalendar* hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
  
	NSUInteger dateUnits = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
	
	NSDateComponents *dateComponents = [gergorianCalendar components:dateUnits fromDate:hebrewDate];
	NSDate* date = [hebrewCalendar dateFromComponents:dateComponents];
  
  return date;
}



@end
