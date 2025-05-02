# flx_no_code

`flx_no_code` is a Flutter package that allows you to build UI dynamically using only JSON — no manual Flutter widget coding needed.

Ideal for no-code/low-code platforms or apps that need configurable interfaces at runtime.

## ✨ Features

- Build UI from JSON configuration
- Supports common Flutter widgets (e.g., Text, Button, Image, Column, Row, etc.)
- Easily extendable to support custom widgets
- Runtime rendering without recompilation

[//]: # (# Entity)

[//]: # ()
[//]: # (## Field Type)

[//]: # (```json)

[//]: # ({)

[//]: # (    "label": "ID",)

[//]: # (    "reference": "id",)

[//]: # (    "type": "number",)

[//]: # (    "column_width": 5,)

[//]: # (    "required": true,)

[//]: # (    "auto_generated": true)

[//]: # (})

[//]: # (```)

[//]: # ()
[//]: # (### text)

[//]: # (### number)

[//]: # (### bool)

[//]: # ()
[//]: # (### datetime)

[//]: # (```json)

[//]: # ({)

[//]: # (    ...)

[//]: # (    "type": "datetime&#40;yyyy-MM-dd HH:mm:ss&#41;",)

[//]: # (    ...)

[//]: # (})

[//]: # (```)

[//]: # ()
[//]: # (# Export)

[//]: # ()
[//]: # (```json)

[//]: # ("exports": [)

[//]: # (    {)

[//]: # (        "name": "Incentive Base Target Product",)

[//]: # (        "type": "xlsx",)

[//]: # (        "backend": "{backend_host}/incentive_details?sort=id&ascending=true",)

[//]: # (        "fields": ["value","category_sub_detail"])

[//]: # (    })

[//]: # (])

[//]: # (```)

[//]: # ()
[//]: # (# Order Layout Configuration)

[//]: # (The layout object defines the structure for different events &#40;e.g., `create`, `update`, `view`&#41; in an order management system. It organizes fields into logical groups and determines how many columns each row should )

[//]: # ()
[//]: # (```json)

[//]: # (    "layout_list_tile": {)

[//]: # (        "title": "code",)

[//]: # (        "subtitle": "period",)

[//]: # (        "trailing": "value")

[//]: # (    },)

[//]: # (```)

[//]: # ()
[//]: # ()
[//]: # (## Structure)

[//]: # (```txt)

[//]: # ("layout": {)

[//]: # (    "{event}": {)

[//]: # (        "{grouping_name}" : {)

[//]: # (            "{field1},{field2}": {column_per_row},)

[//]: # (        },)

[//]: # (    })

[//]: # (})

[//]: # (```)

[//]: # (### Explanation:)

[//]: # ()
[//]: # (- `event`: Specifies the type of operation &#40;create, update, view&#41;.)

[//]: # (- `grouping_name`: Defines logical sections in the layout &#40;e.g., "General Information", "Category"&#41;.)

[//]: # (- Fields &#40;`field1`, `field2`&#41;: A comma-separated list of field names to be displayed in the same row.)

[//]: # (`column_per_row`: Indicates how many columns each row should have.)

[//]: # ()
[//]: # (## Example)

[//]: # (```json)

[//]: # ("layout": {)

[//]: # (    "update": {)

[//]: # (        "Group A" : {)

[//]: # (            "id": 1,)

[//]: # (            "period,code,value,unit_value": 2)

[//]: # (        },)

[//]: # (        "Category": {)

[//]: # (            "category,category_sub,category_sub_detail": 2)

[//]: # (        })

[//]: # (    })

[//]: # (})

[//]: # (```)