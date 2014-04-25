//
//  Sunset.m
//  omer
//
//  Created by yaakov gamliel on 4/6/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "Sunset.h"

CGFloat const   DEFAULT_ZENITH = (CGFloat)90.83333;
CGFloat const   DEGREES_PER_HOUR = 360.0 / 24.0;


@implementation Sunset

- (void)calculateEvent:(NSString *)event forDate:(NSDate *)date longitude:(CGFloat)lon latitidu:(CGFloat)lat {
        
}

#pragma mark - helper

- (CGFloat)degreesToRadians:(CGFloat)degrees {
    CGFloat radians = degrees / 360.0 * 2.0 * M_PI;
    return radians;
}
- (CGFloat)radiansToDegrees:(CGFloat)radians {
    CGFloat degrees = radians * 360.0 / (2.0 * M_PI);
    return degrees;
}

- (CGFloat)coercedegrees:(CGFloat)degrees {
    if (degrees < 0) {
        degrees += 360;
        [self coercedegrees:degrees];
    }
    
    if (degrees >= 360) {
//        d -= 360;
        [self coercedegrees:degrees];
    }
    return degrees;
}

- (void)susetForDate:(NSDate *)date latitude:(CGFloat)lat longitude:(CGFloat)lon {
//   OmerDate *dateTime = [OmerDate toDate:date];
    
//    CGFloat longiudeHour = lon / DEGREES_PER_HOUR;
//    
//    CGFloat baseTime = 18.0;
    
//    CGFloat aproximateTime = dateTime.day + (baseTime - longiudeHour) / 24.0;
    
    //M
//    CGFloat meanSunAnomaly = (0.9856 * aproximateTime) - 3.289;
//    CGFloat sunTrueLongitude = meanSunAnomaly + (1.916 * sin([self degreesToRadians:meanSunAnomaly])) + (0.020 * sin(2*[self degreesToRadians:meanSunAnomaly])) + 282.634;
    
//    sunTrueLongitude = [self coercedegrees:sunTrueLongitude];
    
    //FA
//    CGFloat tanRightAscension = 0.91764 * tan([self degreesToRadians:sunTrueLongitude]);
//    CGFloat sunRightAscension = [self radiansToDegrees:atan(tanRightAscension)];
//    sunRightAscension = [self coercedegrees:sunRightAscension];
}
@end
/*
 
 def calculate(event, date, latitude, longitude)
 datetime = to_datetime(date)
 raise "Unknown event '#{event}'" unless KNOWN_EVENTS.include?(event)
 
 # lngHour
 longitude_hour = longitude / DEGREES_PER_HOUR
 
 # t
 base_time =
 if event == :rise
 6.0
 else
 18.0
 end
 approximate_time = datetime.yday + (base_time - longitude_hour) / 24.0
 
 # M
 mean_sun_anomaly = (0.9856 * approximate_time) - 3.289
 
 # L
 sun_true_longitude = mean_sun_anomaly +
 (1.916 * Math.sin(degrees_to_radians(mean_sun_anomaly))) +
 (0.020 * Math.sin(2 * degrees_to_radians(mean_sun_anomaly))) +
 282.634
 sun_true_longitude = coerce_degrees(sun_true_longitude)
 
 # RA
 tan_right_ascension = 0.91764 * Math.tan(degrees_to_radians(sun_true_longitude))
 sun_right_ascension = radians_to_degrees(Math.atan(tan_right_ascension))
 sun_right_ascension = coerce_degrees(sun_right_ascension)
 
 # right ascension value needs to be in the same quadrant as L
 sun_true_longitude_quadrant  = (sun_true_longitude  / 90.0).floor * 90.0
 sun_right_ascension_quadrant = (sun_right_ascension / 90.0).floor * 90.0
 sun_right_ascension += (sun_true_longitude_quadrant - sun_right_ascension_quadrant)
 
 # RA = RA / 15
 sun_right_ascension_hours = sun_right_ascension / DEGREES_PER_HOUR
 
 sin_declination = 0.39782 * Math.sin(degrees_to_radians(sun_true_longitude))
 cos_declination = Math.cos(Math.asin(sin_declination))
 
 cos_local_hour_angle =
 (Math.cos(degrees_to_radians(options[:zenith])) - (sin_declination * Math.sin(degrees_to_radians(latitude)))) /
 (cos_declination * Math.cos(degrees_to_radians(latitude)))
 
 # the sun never rises on this location (on the specified date)
 return options[:never_rises_result] if cos_local_hour_angle > 1
 # the sun never sets on this location (on the specified date)
 return options[:never_sets_result] if cos_local_hour_angle < -1
 
 # H
 suns_local_hour =
 if event == :rise
 360 - radians_to_degrees(Math.acos(cos_local_hour_angle))
 else
 radians_to_degrees(Math.acos(cos_local_hour_angle))
 end
 
 # H = H / 15
 suns_local_hour_hours = suns_local_hour / DEGREES_PER_HOUR
 
 # T = H + RA - (0.06571 * t) - 6.622
 local_mean_time = suns_local_hour_hours + sun_right_ascension_hours - (0.06571 * approximate_time) - 6.622
 
 # UT = T - lngHour
 gmt_hours = local_mean_time - longitude_hour
 gmt_hours -= 24.0 if gmt_hours > 24
 gmt_hours += 24.0 if gmt_hours <  0
 
 offset_hours = datetime.offset * 24.0
 
 if gmt_hours + offset_hours < 0
 next_day = next_day(datetime)
 return calculate(event, next_day.new_offset, latitude, longitude)
 end
 if gmt_hours + offset_hours > 24
 previous_day = prev_day(datetime)
 return calculate(event, previous_day.new_offset, latitude, longitude)
 end
 
 hour = gmt_hours.floor
 hour_remainder = (gmt_hours.to_f - hour.to_f) * 60.0
 minute = hour_remainder.floor
 seconds = (hour_remainder - minute) * 60.0
 
 Time.gm(datetime.year, datetime.month, datetime.day, hour, minute, seconds)
 end

 
 
 
 
 def degrees_to_radians(d)
 d.to_f / 360.0 * 2.0 * Math::PI
 end
 
 def radians_to_degrees(r)
 r.to_f * 360.0 / (2.0 * Math::PI)
 end
 
 def coerce_degrees(d)
 if d < 0
 d += 360
 return coerce_degrees(d)
 end
 if d >= 360
 d -= 360
 return coerce_degrees(d)
 end
 d
 end

 */