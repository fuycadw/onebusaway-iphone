/**
 * Copyright (C) 2009 bdferris <bdferris@onebusaway.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "OBACommon.h"

NSString * const OBAErrorDomain = @"org.onebusaway.iphone";

const NSInteger kOBAErrorDuplicateEntity = 1000;
const NSInteger kOBAErrorMissingFieldInData = 1001;
const BOOL kIncludeUWActivityInferenceCode = FALSE;

@implementation OBAErrorCodes

+ (NSError*) getErrorFromResponseCode:(int)responseCode {
	switch (responseCode) {
		case OK_RESPONSE:
			return nil;
		case NO_SUCH_STOP_SERVICE_EXCEPTION:
			return [[[NSError alloc] initWithDomain:OBAErrorDomain code:NO_SUCH_STOP_SERVICE_EXCEPTION userInfo:nil] autorelease];
		default:
			return nil;
	}
}

@end

@implementation NSObject (OBAConvenienceMethods)

+ (id) releaseOld:(id<NSObject>)oldValue retainNew:(id<NSObject>)newValue {
	if( oldValue == newValue )
		return newValue;
	[oldValue release];
	return [newValue retain];
}

@end

@implementation NSString (OBAConvenienceMethods)

- (NSComparisonResult) compareUsingNumberSearch:(NSString*)aString {
	return [self compare:aString options:NSNumericSearch];
}

@end

@implementation OBACommon

+ (NSString*) getTimeAsString {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];	
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];	
	NSString * result = [dateFormatter stringFromDate:[NSDate date]];
	[dateFormatter release];
	return result;
}

@end

