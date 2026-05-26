# Agent Skill: generate_json

This skill allows the agent to generate and edit entity JSON configuration files for the no-code Flutter framework in this project.

---

## 1. Context and Objective
The project utilizes a dynamic no-code layout engine where data models, forms, tables, and workflow actions are defined purely in JSON. 
All entity configurations reside at:
`asset/configuration/entity/<entity_id>.json`

Your goal is to parse requirements, plan, construct, validate, and write a high-quality JSON configuration matching the specified models.

---

## 2. Core Constraints & Schema Integrity
Always verify the JSON against the schema in [docs/agent_skills/generate_json.md](file:///Users/suhal/Documents/Development/projects/vneu/flx_studio/packages/flx_nocode_flutter/docs/agent_skills/generate_json.md). Ensure that:

1. **Snake Case Keys**: Keys in the JSON are snake_case (e.g. `layout_form`, `layout_table`, `column_width`, `auto_generated`, `options_source`, `is_multiple`, `layout_form_id`, `layout_print_id`, `confirm_title`, `confirm_message`, `icon_color`, `success_title`, `success_message`, `copy_label`, `copy_value`, `target_variable`, `export_format`, `export_columns`, `filter_fields`).
2. **References Consistency**: Every component `id` in `layout_form` components that inputs or displays a field must match the `reference` of the field in `fields`.
3. **Table Columns**: Every key in `layout_table` must exist in `fields` as a `reference`.
4. **Action Form Mapping**: Any action of type `open_page` or `show_dialog` must include a non-empty `layout_form_id` that references a valid form `id` in `layout_form`.
5. **Types Alignment**: Match the field `type` with correct components:
   - `text` field -> `text_field` component.
   - `number` field -> `number_field` component.
   - `bool` field -> `checkbox` or `switch` component.
   - `datetime` field -> `date_picker` or `time_field` component.
   - `select` field -> `dropdown` component.

---

## 3. Workflow for Creating an Entity Configuration

When asked to generate or modify an entity configuration:

### Step 1: Analyze Requirements
Determine the required fields, data types, validation constraints, relations, and operations.

### Step 2: Structure Fields (`fields`)
Write the field array. Define validation patterns if needed. For example:
- Phone number: `^0[0-9]{9,13}$`
- Email: `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`

### Step 3: Define Backend Endpoints (`backend`)
Configure CRUD operations mapping to the correct API endpoint path. Use `{backend_host}` as the base host placeholder and `{id}` for single item requests.

### Step 4: Map Layout Table (`layout_table`)
Set width flex factors for table columns. Total flex should ideally be around 24 to look balanced (e.g. 4 for ID, 12 for Name, 8 for Date).

### Step 5: Form Design (`layout_form`)
Construct the main editing/creation form. Group fields inside layout columns or rows to ensure a clean, responsive presentation.

### Step 6: Validate and Output
Perform a mental walk-through of the JSON object. Check for trailing commas, brackets, and key structures. Finally, write the file using the appropriate file modification tools to `asset/configuration/entity/<entity_id>.json`.
