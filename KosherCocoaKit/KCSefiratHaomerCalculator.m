/**
 *  KCSefiratHaomerCalculator.m
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 3/1/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
 */

#import "KCSefiratHaomerCalculator.h"
#import "MBCalendarCategories.h"

//  There are always 49 days in the sefira count
const NSInteger lengthOfSefira = 49;

@implementation KCSefiratHaomerCalculator

#pragma mark - Ranges

/* Checking If a Date Falls During Sefira */

+ (BOOL)fallsToday
{
    return [KCSefiratHaomerCalculator fallsOnDate:[NSDate date]];
}

//  YES if date is during the omer, else NO
+ (BOOL)fallsOnDate:(NSDate *)date
{
    return [KCSefiratHaomerCalculator dayOfSefiraForDate:date] != 0;
}

#pragma mark - Day of Sefira

/* Get Day of Sefira */

+ (NSInteger)dayOfSefira
{
	return [KCSefiratHaomerCalculator dayOfSefiraForDate:[NSDate date]];
}

// Returns 1-49, or 0 for all other days
+ (NSInteger)dayOfSefiraForDate:(NSDate *)date
{
	NSDate *firstDayOfTheOmer = [KCSefiratHaomerCalculator _dateOfSixteenNissanForYearOfDate:date];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    
    NSInteger day = [hebrewCalendar daysFromDate:firstDayOfTheOmer toDate:date] + 1;     //  Add one because the sixteenth is the first night, but is zero days since sixteen.
    
    if (day < 0 || day > 49)
    {
        day = 0;
    }
    
    return day;
}

#pragma mark - Utility Method

+ (NSDate *)_dateOfSixteenNissanForYearOfDate:(NSDate *)date
{
	NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
	
    NSInteger hebrewYearInDate = [hebrewCalendar yearsInDate:date];
	
    //  Foundation reserves 7 for Adar II, so Nissan is 8
	return [NSDate dateWithDay:16 Month:8 Year:hebrewYearInDate andCalendar:hebrewCalendar];
}

+ (NSString *)countLabelProviderForCount:(NSInteger)count {
    NSArray *countContainer = @[@"",
                                @"היום יום אחד בעומר",
                                @"היום שני ימים בעומר",
                                @"היום שלושה ימים בעומר",
                                @"היום ארבעה ימים בעומר",
                                @"היום חמישה ימים בעומר",
                                @"היום שישה ימים בעומר",
                                @"היום שבעה ימים, שהם שבוע אחד בעומר",
                                @"היום שמונה ימים, שהם שבוע אחד ויום אחד בעומר",
                                @"היום תשעה ימים, שהם שבוע אחד ושני ימים בעומר",
                                @"היום עשרה ימים, שהם שבוע אחד ושלושה ימים בעומר",
                                @"היום אחת עשר יום, שהם שבוע אחד וארבעה ימים בעומר",
                                @"היום שנים עשר יום, שהם שבוע אחד וחמישה ימים בעומר",
                                @"היום שלושה עשר יום, שהם שבוע אחד ושישה ימים בעומר",
                                @"היום ארבעה עשר יום, שהם שני שבועות בעומר",
                                @"היום חמישה עשר יום, שהם שני שבועות ויום אחד בעומר",
                                @"היום שישה עשר יום, שהם שני שבועות ושני ימים בעומר",
                                @"היום שבעה עשר יום, שהם שני שבועות ושלושה ימים בעומר",
                                @"היום שמונה עשר יום, שהם שני שבועות וארבעה ימים בעומר",
                                @"היום תשעה עשר יום, שהם שני שבועות וחמישה ימים בעומר",
                                @"היום עשרים יום, שהם שני שבועות ושישה ימים בעומר",
                                @"היום אחד ועשרים יום, שהם שלושה שבועות בעומר",
                                @"היום שנים ועשרים יום, שהם שלושה שבועות ויום אחד בעומר",
                                @"היום שלושה ועשרים יום, שהם שלושה שבועות ושני ימים בעומר",
                                @"היום ארבעה ועשרים יום, שהם שלושה שבועות ושלושה ימים בעומר",
                                @"היום חמישה ועשרים יום, שהם שלושה שבועות וארבעה ימים בעומר",
                                @"היום שישה ועשרים יום, שהם שלושה שבועות וחמישה ימים בעומר",
                                @"היום שבעה ועשרים יום, שהם שלושה שבועות ושישה ימים בעומר",
                                @"היום שמונה ועשרים יום, שהם ארבעה שבועות בעומר",
                                @"היום תשעה ועשרים יום, שהם ארבעה שבועות ויום אחד בעומר",
                                @"היום שלושים יום, שהם ארבעה שבועות ושני ימים בעומר",
                                @"היום אחד ושלושים יום, שהם ארבעה שבועות ושלושה ימים בעומר",
                                @"היום שנים ושלושים יום, שהם ארבעה שבועות וארבעה ימים בעומר",
                                @"היום שלושה ושלושים יום, שהם ארבעה שבועות וחמישה ימים בעומר",
                                @"היום ארבעה ושלושים יום, שהם ארבעה שבועות ושישה ימים בעומר",
                                @"היום חמישה ושלושים יום, שהם חמישה שבועות בעומר",
                                @"היום שישה ושלושים יום, שהם חמישה שבועות ויום אחד בעומר",
                                @"היום שבעה ושלושים יום, שהם חמישה שבועות ושני ימים בעומר",
                                @"היום שמונה ושלושים יום, שהם חמישה שבועות ושלושה ימים בעומר",
                                @"היום תשעה ושלושים יום, שהם חמישה שבועות וארבעה ימים בעומר",
                                @"היום ארבעים יום, שהם חמישה שבועות וחמישה ימים בעומר",
                                @"היום אחד וארבעים יום, שהם חמישה שבועות ושישה ימים בעומר",
                                @"היום שנים וארבעים יום, שהם שישה שבועות בעומר",
                                @"היום שלושה וארבעים יום, שהם שישה שבועות ויום אחד בעומר",
                                @"היום ארבעה וארבעים יום, שהם שישה שבועות ושני ימים בעומר",
                                @"היום חמישה וארבעים יום, שהם שישה שבועות ושלושה ימים בעומר",
                                @"היום שישה וארבעים יום, שהם שישה שבועות וארבעה ימים בעומר",
                                @"היום שבעה וארבעים יום, שהם שישה שבועות וחמישה ימים בעומר",
                                @"היום שמונה וארבעים יום, שהם שישה שבועות ושישה ימים בעומר",
                                @"היום תשעה וארבעים יום, שהם שבעה שבועות בעומר"];
    
    if (count >= 49) {
        return countContainer[1];
    }
    
    return countContainer[count];
}

@end
