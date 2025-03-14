# Flexurio No Code - Front End Documentation

This documentation outlines the configuration, entity definition, export settings, and order layout configuration for the Flexurio No Code front end.

---

## 1. App Configuration

The app configuration file is located at `configuration/configuration.json`. This file holds essential settings, such as the application name, company details, logo URLs, backend host, theme colors, and menu grouping.

```json
{
    "app_name": "Flexurio",
    "company": {
        "id": "03",
        "name": "VNEU Teknologi Indonesia",
        "phone": "+628123456789",
        "website": "https://vneu.co.id",
        "address": "Jl. Kebayoran Lama No. 1, Jakarta Selatan, Indonesia"
    },
    "logo_url": "https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/52/0d/3d/520d3d72-de02-38c3-133e-86b0076b281a/AppIcon-1x_U007emarketing-0-10-0-0-85-220.png/230x0w.webp",
    "logo_named_url": "https://ski-compliance-metiska-farma.flexurio.com/src/assets/image/farmasys-resize.png",
    "backend_host": "https://mf-marketing-api.flexurio.com",
    "theme": {
        "color": "#03A9F4",
        "color_soft": "#B3E5FC"
    },
    "menu_group": [
        {
            "label": "Incentive",
            "menu": [
                {
                    "label": "Master",
                    "icon": "fa fa-money",
                    "menu_sub": [
                        {
                            "label": "Sales Product",
                            "entity": "incentive_sales_product"
                        },
                    ]
                },
            ]
        },
    ]
}
```


# Entity

## Field Type
```json
{
    "label": "ID",
    "reference": "id",
    "type": "number",
    "column_width": 5,
    "required": true,
    "auto_generated": true
}
```

### text
### number
### bool

### datetime
```json
{
    ...
    "type": "datetime(yyyy-MM-dd HH:mm:ss)",
    ...
}
```

# Export

```json
"exports": [
    {
        "name": "Incentive Base Target Product",
        "type": "xlsx",
        "backend": "{backend_host}/incentive_details?sort=id&ascending=true",
        "fields": ["value","category_sub_detail"]
    }
]
```

# Order Layout Configuration
The layout object defines the structure for different events (e.g., `create`, `update`, `view`) in an order management system. It organizes fields into logical groups and determines how many columns each row should 

## Structure
```txt
"layout": {
    "{event}": {
        "{grouping_name}" : {
            "{field1},{field2}": {column_per_row},
        },
    }
}
```
### Explanation:

- `event`: Specifies the type of operation (create, update, view).
- `grouping_name`: Defines logical sections in the layout (e.g., "General Information", "Category").
- Fields (`field1`, `field2`): A comma-separated list of field names to be displayed in the same row.
`column_per_row`: Indicates how many columns each row should have.

## Example
```json
"layout": {
    "update": {
        "Group A" : {
            "id": 1,
            "period,code,value,unit_value": 2
        },
        "Category": {
            "category,category_sub,category_sub_detail": 2
        }
    }
}
```