*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Library           BuiltIn

Suite Setup       Create Session    marketstack    https://api.marketstack.com

*** Variables ***
${API_KEY}        6de3bc3aed9c278a1bd96132cb52d7e5
${ENDPOINT}       /v1/eod?access_key=${API_KEY}&symbols=AAPL

*** Test Cases ***

Validate API Response - Pagination
    ${response}=    GET On Session    marketstack    ${ENDPOINT}
    ${json}=        To JSON           ${response.content}
    ${pagination}=  Get From Dictionary    ${json}    pagination

    Should Be Equal As Numbers    ${pagination['limit']}    100
    Should Be Equal As Numbers    ${pagination['offset']}   0
    Should Be Equal As Numbers    ${pagination['count']}    100
    Should Be Equal As Numbers    ${pagination['total']}    100

Validate First Entry in Data Array
    ${response}=       GET On Session    marketstack    ${ENDPOINT}
    ${json}=           Evaluate    json.loads('''${response.text}''')    json
    ${data}=           Get From Dictionary    ${json}    data
    ${first}=          Get From List          ${data}    0

    Should Be Equal               ${first['symbol']}         AAPL
    Should Be Equal               ${first['exchange']}       XNAS
    Should Be Equal               ${first['date']}           2025-04-17T00:00:00+0000

    Should Be Equal As Numbers    ${first['open']}           197.2
    Should Be Equal As Numbers    ${first['high']}           198.8335
    Should Be Equal As Numbers    ${first['low']}            194.42
    Should Be Equal As Numbers    ${first['close']}          196.98
    Should Be Equal As Numbers    ${first['volume']}         52164675.0

    Should Be Equal As Numbers    ${first['adj_open']}       197.2
    Should Be Equal As Numbers    ${first['adj_high']}       198.8335
    Should Be Equal As Numbers    ${first['adj_low']}        194.42
    Should Be Equal As Numbers    ${first['adj_close']}      196.98
    Should Be Equal As Numbers    ${first['adj_volume']}     52164675.0

    Should Be Equal As Numbers    ${first['split_factor']}   1.0
    Should Be Equal As Numbers    ${first['dividend']}       0.0

Validate Numeric Fields Are Numbers
    ${response}=    GET On Session    marketstack    url=/v1/eod?access_key=6de3bc3aed9c278a1bd96132cb52d7e5&symbols=AAPL
    ${json}=        Evaluate    json.loads('''${response.text}''')    json
    ${data}=        Get From Dictionary    ${json}    data
    ${first}=       Get From List    ${data}    0

    ${numeric_fields}=    Create List    open    high    low    close    volume    adj_open    adj_high    adj_low    adj_close    adj_volume    split_factor    dividend

    FOR    ${field}    IN    @{numeric_fields}
        ${value}=    Get From Dictionary    ${first}    ${field}
        Should Be True    ${value} == float(${value}) or ${value} == int(${value})
    END
