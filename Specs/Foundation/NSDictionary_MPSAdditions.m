#import "NSDictionary+MPSAdditions.h"

SpecBegin(NSDictionary_MPSAdditions)

describe(@"NSDictionary_MPSAdditions", ^{
	describe(@"mps_stringForKey", ^{
		it(@"should return a NSString", ^{
			NSDictionary *dictionary = @{};
			id returnedValue = [dictionary mps_stringForKey:@"email"];
			
			expect(returnedValue).to.beKindOf([NSString class]);
			expect(returnedValue).to.equal(@"");
			
			dictionary = @{ @"email" : @"test@example.com"};
			returnedValue = [dictionary mps_stringForKey:@"email"];
			
			expect(returnedValue).to.beKindOf([NSString class]);
			expect(returnedValue).to.equal(@"test@example.com");
		});
	});
	
	describe(@"mps_integerForKey", ^{
		it(@"should return a NSInteger", ^{
			NSDictionary *dictionary = @{};
			NSInteger returnedValue = [dictionary mps_integerForKey:@"follower_count"];
			
			expect(returnedValue).to.equal(0);
			
			dictionary = @{ @"follower_count" : @51};
			returnedValue = [dictionary mps_integerForKey:@"follower_count"];
			
			expect(returnedValue).to.equal(51);
		});
	});
	
	describe(@"mps_dateForKey", ^{
		it(@"should return a NSDate", ^{
			NSDictionary *dictionary = @{};
			id returnedValue = [dictionary mps_dateForKey:@"created_at"];
			
			expect(returnedValue).to.equal(nil);
			
			dictionary = @{ @"created_at" : @"2011-04-22T13:33:48Z"};
			returnedValue = [dictionary mps_dateForKey:@"created_at"];
			
			expect(returnedValue).toNot.beNil();
			expect(returnedValue).to.beKindOf([NSDate class]);
		});
	});
	
	describe(@"mps_dictionaryForKey", ^{
		it(@"should return a NSDictionary", ^{
			NSDictionary *dictionary = @{};
			id returnedValue = [dictionary mps_dictionaryForKey:@"user"];
			
			expect(returnedValue).to.beKindOf([NSDictionary class]);
			expect(returnedValue).to.equal(@{});
			
			dictionary = @{ @"user" :  @{
									@"login": @"octocat",
									@"id": @1,
									@"avatar_url": @"https://github.com/images/error/octocat_happy.gif",
									@"gravatar_id": @"somehexcode",
									@"url": @"https://api.github.com/users/octocat"
									} } ;
			returnedValue = [dictionary mps_dictionaryForKey:@"user"];
			
			expect(returnedValue).toNot.beNil();
			expect(returnedValue).to.beKindOf([NSDictionary class]);
			expect([returnedValue objectForKey:@"login"]).to.equal(@"octocat");
		});
	});
	
	describe(@"mps_arrayForKey", ^{
		it(@"should return a NSArray", ^{
			NSDictionary *dictionary = @{};
			id returnedValue = [dictionary mps_arrayForKey:@"labels"];
			
			expect(returnedValue).to.beKindOf([NSArray class]);
			expect(returnedValue).to.equal(@[]);
			
			dictionary = @{ @"labels": @[
									@{
										@"url": @"https://api.github.com/repos/octocat/Hello-World/labels/bug",
										@"name": @"bug",
										@"color": @"f29513"
										}
									] } ;
			returnedValue = [dictionary mps_arrayForKey:@"labels"];
			
			expect(returnedValue).toNot.beNil();
			expect(returnedValue).to.beKindOf([NSArray class]);
			expect(((NSArray *)returnedValue).count).to.equal(1);
		});
	});
});

SpecEnd
