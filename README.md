# Basis Universal Pixel Template (with AIR)

The Basis Universal Pixel community template is a Google Tag Manager [community gallery template repository](https://support.google.com/tagmanager/answer/9454109) that can be used to easily implement the Basis Universal Pixel using Google Tag Manager.

## Prerequisites

- A **Basis Universal Pixel ID** (provided by your Basis account team)
- A Google Tag Manager container (web)

## Installation

1. In Google Tag Manager, go to **Templates → Search Gallery**
2. Search for **Basis Universal Pixel**
3. Click **Add to Workspace**
4. Create a new tag using this template and configure the fields below

## Configuration

### Required

| Field | Description |
|---|---|
| **Universal Pixel ID** | Your Basis-provided pixel ID |

### Tag Behavior

| Field | Description |
|---|---|
| **Enable User Matching** | Enables user matching by appending `um=1` to the up.js request. Enabled by default. |
| **Enable Cookieless** | Enables cookieless tracking mode. Enabled by default. |

### Ecommerce Tracking

| Field | Description |
|---|---|
| **Use GA4 dataLayer Integration** | When enabled, revenue and transaction ID are automatically read from the GA4 `ecommerce` object in the dataLayer. Ensure your GA4 ecommerce push occurs before this tag fires. |
| **Revenue** | Numeric value for revenue (only shown when GA4 integration is disabled) |
| **Transaction Id** | Transaction identifier (only shown when GA4 integration is disabled) |

### Custom Data

| Field | Description |
|---|---|
| **Key** | Optional key name to pass as part of the `cntrData` object |
| **String** | Optional string value paired with the key above |

### Advanced Identity Resolution (AIR)

| Field | Description |
|---|---|
| **Enable Advanced Identity Resolution** | Loads `air.js` for identity resolution. When enabled without PII fields populated, identity resolution will not occur. |


## Console Logging

By default, the template only logs to the browser console during GTM **preview/debug mode** and not in production. This is useful for:
- Verifying the up.js URL being constructed
- Confirming air.js loading and track calls
- Troubleshooting configuration issues

## How It Works

1. On tag fire, the template builds a `cntrData` object from the configured fields and/or the GA4 ecommerce data layer
2. The `up.js` script is loaded from `https://cdn01.basis.net/assets/up.js`
3. `cntrUpTag.track` is called with the pixel ID
4. If AIR is enabled, `air.js` is additionally loaded and `cntrAir.setIdForGtmTemplate` is called with the Universal Pixel ID the user passes

## Feedback

To submit feedback, see the [GitHub Issues](../../issues) section of this repository.

---

Copyright 2026 Basis Global Technologies, LLC. Licensed under the [Apache License, Version 2.0](LICENSE).
