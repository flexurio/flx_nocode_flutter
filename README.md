# Flexurio No Code

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