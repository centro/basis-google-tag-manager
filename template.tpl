___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Basis Universal Pixel",
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAS1BMVEVHcEwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACioqL////6+vr09PTV1dV4eHgAAACnp6eVlZWdnZ3q6uoAAADj4+MAAAAmJibGxsYRYb+bAAAAF3RSTlMAClD/LfiAaK7////////e/////43/FGBgBkIAAACySURBVHgBjZJVAoMwFASBxd2T+5+0i8XbMr+TPI/eEFvYLoFFasnMlpnpcjgURkJ4aFn6snxcCqCqm4u27XqzpgHAWBtMAAajDcp2rsjY0IIkug3KBSc9pWpnhScbHKyqDcp2mskRtsdJHJVKKnrVjifJ9sgdTk5BO19h/YLQ1XUHkkfElQul2kyhqq3IzI91pYbgj695xkdSW7ZSAEjfrCy07PjHmeQvD8w7zeT9UYf5ADu3DMcf0f2EAAAAAElFTkSuQmCC"
  },
  "description": "Trigger: Page View on All Pages",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "universalPixelId",
    "displayName": "Universal Pixel ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "userMatching",
    "checkboxText": "Enable User Matching",
    "simpleValueType": true,
    "defaultValue": true
  },
  {
    "type": "CHECKBOX",
    "name": "cookieless",
    "checkboxText": "Enable Cookieless",
    "simpleValueType": true,
    "defaultValue": true
  },
  {
    "type": "CHECKBOX",
    "name": "enableAir",
    "checkboxText": "Enable Advanced Identity Resolution",
    "simpleValueType": true,
    "help": "\u003cstrong\u003eAir Identity Resolution:\u003c/strong\u003e\n\u003cbr/\u003e                                                                                                                  \n\u003cbr/\u003e                                                                                                                                                            When enabled, this tag will attempt to resolve a visitor\u0027s identity, which improves audience matching for ad targeting.\n\u003cbr/\u003e\n\u003cbr/\u003e                                                                                                                                                                                                                                                                                                                 \u003cstrong\u003eNote:\u003c/strong\u003e if deployed on pages without PII input fields and no values are provided above, identity resolution will not occur. \n\u003cbr/\u003e"
  },
  {
    "type": "CHECKBOX",
    "name": "useGA4",
    "checkboxText": "Use GA4 dataLayer Integration",
    "simpleValueType": true,
    "help": "\u003cstrong\u003eUse GA4 Ecommerce:\u003c/strong\u003e\u003cbr/\u003e                                                                                                                                                     \n  \u003cbr/\u003e                                                                                                                                                                                        \n  If this feature is enabled, \u003cstrong\u003erevenue and transaction ID\u003c/strong\u003e will be read automatically from the GA4 \u003cstrong\u003eecommerce\u003c/strong\u003e object in the dataLayer. Ensure your GA4 ecommerce push occurs     \n  before this tag fires.\u003cbr/\u003e                                                                                                                                                                  \n  \u003cbr/\u003e                                                                                                                                                                                        \n  Example:\u003cbr/\u003e                                                                                                                                                                                \n  \u003cbr/\u003e                                                                                                                                                                                     \n  window.dataLayer \u003d window.dataLayer || [];\u003cbr/\u003e\n  \u003cbr/\u003e\n  window.dataLayer.push({\u003cbr/\u003e\n  \u0026nbsp;\u0026nbsp;\"event\": \"purchase\",\u003cbr/\u003e                                                                                                                                                        \n  \u0026nbsp;\u0026nbsp;\"ecommerce\": {\u003cbr/\u003e                                                                                                                                                              \n  \u0026nbsp;\u0026nbsp;\u0026nbsp;\u0026nbsp;\"transaction_id\": \"T_12345\",\u003cbr/\u003e                                                                                                                                    \n  \u0026nbsp;\u0026nbsp;\u0026nbsp;\u0026nbsp;\"value\": 30.03\u003cbr/\u003e                                                                                                                                                  \n  \u0026nbsp;\u0026nbsp;}\u003cbr/\u003e                                                                                                                                                                           \n  });"
  },
  {
    "type": "TEXT",
    "name": "dlvRev",
    "displayName": "Revenue",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^-?\\d+(\\.\\d+)?$"
        ],
        "errorMessage": "Value must be numeric"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "useGA4",
        "paramValue": false,
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "dlvTransactionId",
    "displayName": "Transaction Id",
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "useGA4",
        "paramValue": false,
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "Key String Pair",
    "displayName": "Key/String Pair",
    "subParams": [
      {
        "type": "TEXT",
        "name": "dlvKey",
        "displayName": "Key",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY",
            "enablingConditions": [
              {
                "paramName": "dlvString",
                "paramValue": "",
                "type": "PRESENT"
              }
            ],
            "errorMessage": "\u0027Key\u0027 is required when \u0027String\u0027 is specified"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "dlvString",
        "displayName": "String",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY",
            "enablingConditions": [
              {
                "paramName": "dlvKey",
                "paramValue": "",
                "type": "PRESENT"
              }
            ],
            "errorMessage": "\u0027String\u0027 is required when \u0027Key\u0027 is specified"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const callInWindow = require('callInWindow');
const setInWindow = require('setInWindow');
const copyFromDataLayer = require('copyFromDataLayer');
const log = require('logToConsole');

const pixelId = data.universalPixelId;

// Build optional cntrData object from DLV variables
var cntrData = {};
var hasCntrData = false;

if (data.dlvKey && data.dlvString) {
    cntrData[data.dlvKey] = data.dlvString;
    hasCntrData = true;
}

if (data.useGA4) {
    var ecommerce = copyFromDataLayer('ecommerce', 1);
    if (ecommerce) {
        if (ecommerce.value) {
            cntrData.cntr_revenue = ecommerce.value;
            hasCntrData = true;
        }
        if (ecommerce.transaction_id) {
            cntrData.cntr_transactionId = ecommerce.transaction_id;
            hasCntrData = true;
        }
    }
} else {
    if (data.dlvRev) {
        cntrData.cntr_revenue = data.dlvRev;
        hasCntrData = true;
    }
    if (data.dlvTransactionId) {
        cntrData.cntr_transactionId = data.dlvTransactionId;
        hasCntrData = true;
    }
}
if (hasCntrData) {
    setInWindow('cntrData', cntrData, true);
}

// Build up.js URL based on user settings
var upJsParams = [];
if (data.userMatching) upJsParams.push('um=1');
if (!data.cookieless) upJsParams.push('ca=0');
var upJsUrl = 'https://cdn01.basis.net/assets/up.js' + (upJsParams.length ? '?' + upJsParams.join('&') : '');
log('upJsUrl:', upJsUrl);

injectScript(
    upJsUrl,
    function() {
        // up.js powers the pixel - fire it now so it always fires, regardless of air.js
        log('up.js loaded, calling track');
        callInWindow('cntrUpTag.track', 'cntrData', pixelId);
        data.gtmOnSuccess();
        if (data.enableAir) {
            log('loading air.js');
            injectScript(
                'https://cdn01.basis.net/assets/air.js',
                function() {
                    log('air.js loaded, calling setIdForGtmTemplate');
                    callInWindow('cntrAir.setIdForGtmTemplate', pixelId);
                },
                function() {
                    log('Failed to load air.js');
                },
                'basis_air_script'
            );
        }
    },
    function() {
        log('Failed to load up.js');
        data.gtmOnFailure();
    },
    'basis_up_script'
);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn01.basis.net/assets/*"
              },
              {
                "type": 1,
                "string": "https://melody.wildwebapps.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "cntrUpTag.track"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "cntrData"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "cntrAir.setIdForGtmTemplate"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_airCallback"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ecommerce"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: success path
  code: |-
    mock('injectScript', (url, onSuccess, onFailure) => {
      onSuccess();
    });

    var calledWith = [];
    mock('callInWindow', function(a, b, c) {
      calledWith = [a, b, c];
    });

    runCode({ universalPixelId: 'TEST-PIXEL-123' });

    assertThat(calledWith[0]).isEqualTo('cntrUpTag.track');
    assertThat(calledWith[1]).isEqualTo('cntrData');
    assertThat(calledWith[2]).isEqualTo('TEST-PIXEL-123');
    assertApi('gtmOnSuccess').wasCalled();
- name: failure path
  code: |-
    mock('injectScript', function(url, onSuccess, onFailure) {
      onFailure();
    });

    var failCalledWith = [];
    mock('callInWindow', function(a, b, c) {
      failCalledWith = [a, b, c];
    });

    runCode({ universalPixelId: 'TEST-PIXEL-123' });

    assertThat(failCalledWith[0]).isUndefined();
    assertApi('gtmOnFailure').wasCalled();
- name: Upjs url constructed with no extra features
  code: |2
      // ─── Test 1: No params when userMatching=false, cookieless=true ───
      mock('injectScript', function(url, onSuccess, onFailure, cacheKey) {
        if (cacheKey === 'basis_up_script') {
          assertThat(url).isEqualTo('https://cdn01.basis.net/assets/up.js');
        }
      });
      mock('logToConsole', function() {});
      runCode({universalPixelId: 'test-pixel-123', userMatching: false, cookieless: true});
- name: Upjs url constructed with User Matching
  code: |2
     // ─── Test 2: um=1 when userMatching=true ───
      mock('injectScript', function(url, onSuccess, onFailure, cacheKey) {
        if (cacheKey === 'basis_up_script') {
          assertThat(url).isEqualTo('https://cdn01.basis.net/assets/up.js?um=1');
        }
      });
      mock('logToConsole', function() {});
      runCode({universalPixelId: 'test-pixel-123', userMatching: true, cookieless: true});
- name: Upjs url constructed without cookieless
  code: |2
      // ─── Test 3: ca=0 when cookieless=false ───
      mock('injectScript', function(url, onSuccess, onFailure, cacheKey) {
        if (cacheKey === 'basis_up_script') {
          assertThat(url).isEqualTo('https://cdn01.basis.net/assets/up.js?ca=0');
        }
      });
      mock('logToConsole', function() {});
      runCode({universalPixelId: 'test-pixel-123', userMatching: false, cookieless: false});
- name: Upjs url constructed with both query params
  code: |2
     // ─── Test 4: Both params when userMatching=true, cookieless=false ───
      mock('injectScript', function(url, onSuccess, onFailure, cacheKey) {
        if (cacheKey === 'basis_up_script') {
          assertThat(url).isEqualTo('https://cdn01.basis.net/assets/up.js?um=1&ca=0');
        }
      });
      mock('logToConsole', function() {});
      runCode({universalPixelId: 'test-pixel-123', userMatching: true, cookieless: false});
- name: useGA4 — revenue and transactionId populated from ecommerce data layer
  code: |-
    var cntrDataSet;
    mock('copyFromDataLayer', function(key) {
        if (key === 'ecommerce') return { value: 49.99, transaction_id: 'TXN-001' };
    });
    mock('setInWindow', function(key, val) {
        if (key === 'cntrData') cntrDataSet = val;
    });
    mock('injectScript', mockInjectSuccess);
    mock('callInWindow', function() {});
    mock('logToConsole', mockLog);

    runCode({ universalPixelId: 'TEST-PIXEL', useGA4: true, enableAir: false, cookieless: true });

    assertThat(cntrDataSet.cntr_revenue).isEqualTo(49.99);
    assertThat(cntrDataSet.cntr_transactionId).isEqualTo('TXN-001');
- name: useGA4 — empty ecommerce object, cntrData not set
  code: |
    var cntrDataSet2;
    mock('copyFromDataLayer', function(key) {
        if (key === 'ecommerce') return null;
    });
    mock('setInWindow', function(key, val) {
        if (key === 'cntrData') cntrDataSet2 = val;
    });
    mock('injectScript', mockInjectSuccess);
    mock('callInWindow', function() {});
    mock('logToConsole', mockLog);

    runCode({ universalPixelId: 'TEST-PIXEL', useGA4: true, enableAir: false, cookieless: true });

    assertThat(cntrDataSet2).isUndefined();
- name: useGA4 disabled — dlvRev and dlvTransactionId used instead
  code: |
    var cntrDataSet3;
    mock('copyFromDataLayer', function() {});
    mock('setInWindow', function(key, val) {
        if (key === 'cntrData') cntrDataSet3 = val;
    });
    mock('injectScript', mockInjectSuccess);
    mock('callInWindow', function() {});
    mock('logToConsole', mockLog);

    runCode({ universalPixelId: 'TEST-PIXEL', useGA4: false, dlvRev: 29.99, dlvTransactionId: 'TXN-002', enableAir: false, cookieless: true });

    assertThat(cntrDataSet3.cntr_revenue).isEqualTo(29.99);
    assertThat(cntrDataSet3.cntr_transactionId).isEqualTo('TXN-002');
- name: useGA4 — only revenue present in ecommerce, no transaction_id
  code: |-
    var cntrDataSet4;
    mock('copyFromDataLayer', function(key) {
        if (key === 'ecommerce') return { value: 10.00 };
    });
    mock('setInWindow', function(key, val) {
        if (key === 'cntrData') cntrDataSet4 = val;
    });
    mock('injectScript', mockInjectSuccess);
    mock('callInWindow', function() {});
    mock('logToConsole', mockLog);

    runCode({ universalPixelId: 'TEST-PIXEL', useGA4: true, enableAir: false, cookieless: true });

    assertThat(cntrDataSet4.cntr_revenue).isEqualTo(10.00);
    assertThat(cntrDataSet4.cntr_transactionId).isUndefined();
- name: airjs fails to load - pixel still fires
  code: |-
    var trackCalled = false;
    mock('injectScript', function(url, onSuccess, onFailure, cacheKey) {
      if (cacheKey === 'basis_up_script') onSuccess();   // up.js loads
      else onFailure();                                  // air.js fails
    });
    mock('callInWindow', function(a) {
      if (a === 'cntrUpTag.track') trackCalled = true;
    });
    mock('logToConsole', function() {});

    runCode({ universalPixelId: 'TEST-PIXEL-123', enableAir: true, cookieless: true });

    assertThat(trackCalled).isEqualTo(true);
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
setup: |-
  // Shared mocks
  var mockInjectSuccess = function(url, onSuccess, onFailure, cacheKey) {
      onSuccess();
  };
  var mockLog = function() {};


___NOTES___

Created on 4/9/2026, 5:16:16 PM


