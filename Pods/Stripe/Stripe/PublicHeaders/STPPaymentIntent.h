//
//  STPPaymentIntent.h
//  Stripe
//
//  Created by Daniel Jackson on 6/27/18.
//  Copyright © 2018 Stripe, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STPAPIResponseDecodable.h"
#import "STPPaymentIntentEnums.h"
#import "STPPaymentMethodEnums.h"

NS_ASSUME_NONNULL_BEGIN

@class STPPaymentIntentAction;

/**
 A PaymentIntent tracks the process of collecting a payment from your customer.

 @see https://stripe.com/docs/api#payment_intents
 @see https://stripe.com/docs/payments/dynamic-authentication
 */
@interface STPPaymentIntent : NSObject<STPAPIResponseDecodable>

/**
 The Stripe ID of the PaymentIntent.
 */
@property (nonatomic, readonly) NSString *stripeId;

/**
 The client secret used to fetch this PaymentIntent
 */
@property (nonatomic, readonly) NSString *clientSecret;

/**
 Amount intended to be collected by this PaymentIntent.
 */
@property (nonatomic, readonly) NSNumber *amount;

/**
 If status is `STPPaymentIntentStatusCanceled`, when the PaymentIntent was canceled.
 */
@property (nonatomic, nullable, readonly) NSDate *canceledAt;

/**
 Capture method of this PaymentIntent
 */
@property (nonatomic, readonly) STPPaymentIntentCaptureMethod captureMethod;

/**
 Confirmation method of this PaymentIntent
 */
@property (nonatomic, readonly) STPPaymentIntentConfirmationMethod confirmationMethod;

/**
 When the PaymentIntent was created.
 */
@property (nonatomic, nullable, readonly) NSDate *created;

/**
 The currency associated with the PaymentIntent.
 */
@property (nonatomic, readonly) NSString *currency;

/**
 The `description` field of the PaymentIntent.
 An arbitrary string attached to the object. Often useful for displaying to users.
 */
@property (nonatomic, nullable, readonly) NSString *stripeDescription;

/**
 Whether or not this PaymentIntent was created in livemode.
 */
@property (nonatomic, readonly) BOOL livemode;

/**
 If `status == STPPaymentIntentStatusRequiresAction`, this
 property contains the next action to take for this PaymentIntent.
*/
@property (nonatomic, nullable, readonly) STPPaymentIntentAction *nextAction;

/**
 Email address that the receipt for the resulting payment will be sent to.
 */
@property (nonatomic, nullable, readonly) NSString *receiptEmail;

/**
 The Stripe ID of the Source used in this PaymentIntent.
 */
@property (nonatomic, nullable, readonly) NSString *sourceId;

/**
 The Stripe ID of the PaymentMethod used in this PaymentIntent.
 */
@property (nonatomic, nullable, readonly) NSString *paymentMethodId;

/**
 Status of the PaymentIntent
 */
@property (nonatomic, readonly) STPPaymentIntentStatus status;

/**
 The list of payment method types (e.g. `@[@(STPPaymentMethodTypeCard)]`) that this PaymentIntent is allowed to use.
 */
@property (nonatomic, nullable, readonly) NSArray<NSNumber *> *paymentMethodTypes;

#pragma mark - Deprecated

/**
 If `status == STPPaymentIntentStatusRequiresAction`, this
 property contains the next source action to take for this PaymentIntent.
 
 @deprecated Use nextAction instead
 */
@property (nonatomic, nullable, readonly) STPPaymentIntentAction *nextSourceAction __attribute__((deprecated("Use nextAction instead", "nextAction")));

@end

NS_ASSUME_NONNULL_END
