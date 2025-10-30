# SAP BTP : RAP Sales Order Project

This project is a Proof-of-Concept (PoC) demonstrating the end-to-end
creation of a backend application on the SAP BTP ABAP Environment
(Steampunk / ABAP Cloud).

The objective was to build a simplified Sales Order model to master the
core concepts of the ABAP RESTful Application Programming Model (RAP)
including data modeling, behavior
definition, and service exposure.

------------------------------------------------------------------------

## 🧩 Architecture & Key Components

This project successfully demonstrates the creation of the entire RAP
backend stack.

### 1. Data Foundation (Dictionary)

-   **ZSO_HEADER:** Database table for Sales Order headers.\
-   **ZSO_ITEM:** Database table for Sales Order items.

### 2. Core Structure (CDS Interface Views)

-   **ZI_SALESORDER_HEADER:** A root view entity defining the Header
    Business Object.\
-   **ZI_SALESORDER_ITEM:** A separate root view entity (required by
    trial constraints) defining the Item Business Object.\
-   **Association:** A trial-safe, read-only association `_Header` was
    defined in the Item view, pointing back to the Header.

### 3. The Engine (Behavior Definitions)

-   **ZI_SALESORDER_HEADER (BDEF):** A full Behavior Definition for the
    Header, enabling create, update, delete with field controls and
    table mapping.\
-   **ZI_SALESORDER_ITEM (BDEF):** A separate, independent Behavior
    Definition for the Item, also enabling full CRUD operations.

### 4. Service Layer (API Exposure)

-   **ZUI_SALESORDER_SERVICE (Service Definition):** A single Service
    Definition exposing both ZI_SALESORDER_HEADER and ZI_SALESORDER_ITEM
    as service entities.\
-   **ZUI_SALESORDER_BINDING (Service Binding):** A published OData V4
    (UI) Service Binding that makes the entire backend accessible as a
    live, consumable API.

------------------------------------------------------------------------

## 🚀 Project Status: Backend Complete, UI Generation Blocked

This project was a successful build of the complete backend stack. All
components (Tables, CDS Views, BDEFs, Service Definition, and Service
Binding) were successfully activated and published.

### ❌ Root Cause of UI Limitation

The BTP ABAP Trial's strict feature scope forbids the use of the
**composition** keyword in the Behavior Definition.\
This keyword is essential for defining the parent-child (Header → Item)
relationship that the standard Fiori Elements "List Report Object Page"
generator relies on.

### 🧠 Diagnostic Insight

Without this **composition** defined, the Fiori generator cannot create
the navigation between the Header (parent) and Item (child) entities.\
Additionally, the **WAPA (Fiori App)** object type was blocked from
creation within the required "Structure Package," indicating a
non-configurable environmental constraint.

------------------------------------------------------------------------

## ✅ Conclusion

The project is a complete success in its primary mission: to build and
demonstrate the core backend architecture of a modern RAP application.\
The UI failure is **not a bug in the code** but a documented limitation
of the **SAP BTP Trial Environment**.
