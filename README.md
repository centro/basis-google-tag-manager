# Basis Universal Pixel — Google Tag Manager Template

The Basis Universal Pixel template is a [Google Tag Manager community template](https://support.google.com/tagmanager/answer/9454109) that allows you to deploy our universal pixel using a GTM container.

## Prerequisites

- A **Basis Universal Pixel ID** (available in Basis or provided by your account team)
- A Google Tag Manager **web** container

## Installation

1. In Google Tag Manager, go to **Templates** > **Search Gallery**.
2. Search for **Basis Universal Pixel**.
3. Select **Add to Workspace**.
4. Select **Tags** > **New** and choose **Basis Universal Pixel Template** as the tag type.
5. Configure the fields described below.
6. Add a trigger and save.
7. Save the tag.

## Configuration

### Required

| Field | Description |
|---|---|
| **Universal Pixel ID** | The Basis-provided pixel ID. |

### Tag Behavior

| Field | Description |
|---|---|
| **Enable User Matching** | Enables cookie-based user matching by appending `um=1` to the `up.js` request. On by default. Turn off user matching if your privacy policy does not disclose data matching with Basis. |
| **Enable Cookieless** | Enables cookieless tracking. On by default. |

### Ecommerce Tracking

| Field | Description |
|---|---|
| **Use GA4 dataLayer Integration** | When enabled, revenue and transaction ID are automatically read from the GA4 `ecommerce` object in the dataLayer. The **Revenue** and **Transaction Id** fields below are hidden when this feature is on. |
| **Revenue** | GTM variable reference or static numeric value for revenue. Available only when GA4 integration is turned off. |
| **Transaction Id** | GTM variable reference or static value for the transaction or order ID. Available only when GA4 integration is turned off. |

#### GA4 dataLayer Example

When using the GA4 dataLayer integration, ensure your ecommerce push fires **before** this tag. For example, you can configure the tag trigger on the `purchase` event to guarantee the data layer is populated in time.

```javascript
window.dataLayer = window.dataLayer || [];
window.dataLayer.push({
  "event": "purchase",
  "ecommerce": {
    "transaction_id": "T_12345",
    "value": 30.03
  }
});
```

### Custom Data

| Field | Description |
|---|---|
| **Key** | Optional key name to pass as part of the `cntrData` object. |
| **String** | Optional value paired with the key. |

Use key/string pairs to pass custom parameters for audience segmentation or conversion rules in the Basis platform. Some common examples:

| Key | Example Value | Use Case |
|---|---|---|
| `event` | `purchase` | Tag a conversion event |
| `page_type` | `checkout` | Identify page type for rule targeting |
| `segment` | `high_value` | Define audience segment logic |

### Advanced Identity Resolution (AIR)

| Field | Description |
|---|---|
| **Enable Advanced Identity Resolution** | Loads `air.js` and turns on PII-based visitor identity resolution, improving audience matching for targeting. If deployed on pages without PII input fields, identity resolution will not occur. |

## Debugging

By default, the template logs to the browser console only during GTM **Preview/Debug mode**, not in production. This is useful for:

- Verifying the `up.js` URL being constructed
- Confirming `air.js` loading and track calls
- Troubleshooting configuration issues

## How It Works

1. When the tag fires, the template builds a `cntrData` data object from the configured fields and the GA4 ecommerce data layer, if it's in use.
2. The `up.js` script is loaded asynchronously from the Basis CDN (`https://cdn01.basis.net/assets/up.js`).
3. The pixel fires and `cntrUpTag.track` is called with the pixel ID.
4. If **Advanced Identity Resolution** is turned on, `air.js` is additionally loaded and `cntrAir.setIdForGtmTemplate` is called with the universal pixel ID to turn on PII-based identity matching. When the user enters PII into the page, the PII based identity matching call fires, and then a second call to track fires with the pixel ID and the retrieved PII identity.

## Feedback

To submit feedback or report a bug, use the [GitHub Issues](https://github.com/centro/basis-google-tag-manager/issues) section of this repository.

---

Copyright 2026 Basis Global Technologies, LLC. Licensed under the [Apache License, Version 2.0](https://github.com/centro/basis-google-tag-manager/blob/main/LICENSE).