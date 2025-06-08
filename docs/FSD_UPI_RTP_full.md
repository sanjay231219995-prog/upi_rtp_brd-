# Functional Specification Document  
## UPI 2.0 Real-Time Payments (RTP)   
**Author:** Sanjay Kumar  

---

### 1 Purpose  
Translate the BRD v1.0 requirements into precise API definitions, data models, field-level ISO 20022 mappings, and error/exceptions required for Phase 1 domestic RTP over UPI 2.0.

---

### 2 Reference Documents  

| Ref  | Title                                     | Path                                   |
|------|-------------------------------------------|----------------------------------------|
| BRD  | Business Requirements Document v1.0       | `docs/BRD_UPI_RTP_full.md`             |
| UC   | Use-Case Catalogue v0.1                   | `docs/02_Use_Case_Catalogue.md`        |
| ISO  | CBPR+ Nov 2025 pacs.008/pacs.002 XSD      | `/references/cbpr_plus/`               |
| NPCI | NPCI UPI 2.0 Product Booklet             | `/references/npci_upi2.pdf`            |

---

### 3 API Inventory  

| # | Endpoint                                  | Method | Purpose                        | UC-IDs       | Auth Scheme    |
|---|-------------------------------------------|--------|--------------------------------|--------------|----------------|
| 1 | `/pay/api/mobile/upi/intent/android`      | POST   | Initiate P2P push payment      | UC-01        | API Key Header |
| 2 | `/pay/api/mobile/upi/collect`             | POST   | Merchant dynamic-QR collect    | UC-02        | API Key Header |
| 3 | `/pay/api/mobile/upi/reversal`            | POST   | Reverse a settled txn          | UC-04, UC-01 | API Key Header |
| 4 | `/pay/api/mobile/upi/status`              | GET    | Check txn status & reconciliation | UC-01,02,03,05 | API Key Header |
| 5 | `/pay/api/mobile/upi/validateVpa`         | POST   | Resolve VPA alias / validate   | UC-05        | API Key Header |

--



## 4 Security Schemes

| Scheme Name     | Type    | Location | Header Name |
|-----------------|---------|----------|-------------|
| PhonePeApiKey   | apiKey  | header   | X-VERIFY    |

---

## 5 Endpoints

### 5.1. `POST /pay/api/mobile/upi/intent/android`

**Summary:** Initiate P2P push payment (Android)

- **Request Body Schema:** `IntentRequest`
- **Responses:**
  - `200`: `IntentSuccess` – Payment initiated
  - `400`: `ValidationError` – Bad request
  - `401`: `AuthError` – Auth failure
  - `409`: `DuplicateTxn` – Duplicate transaction

---

### 5.2. `POST /pay/api/mobile/upi/collect`

**Summary:** Merchant dynamic-QR collect payment

- **Request Body Schema:** `CollectRequest`
- **Responses:**
  - `201`: `CollectSuccess` – Request accepted
  - `400`: `ValidationError` – Validation failed

---

### 5.3. `GET /pay/api/mobile/upi/status`

**Summary:** Get transaction status

- **Query Parameters:**
  - `txnId` (string) – Transaction ID

- **Responses:**
  - `200`: `StatusSuccess` – Status returned
  - `404`: `NotFound` – Transaction not found

---

### 5.4. `POST /pay/api/mobile/upi/reversal`

**Summary:** Reverse a settled transaction

- **Request Body Schema:** `ReversalRequest`
- **Response:**
  - `200`: `ReversalSuccess` – Reversal successful

---

### 5.5. `POST /pay/api/mobile/upi/validateVpa`

**Summary:** Resolve or validate a VPA alias

- **Request Body Schema:** `VpaRequest`
- **Responses:**
  - `200`: `VpaSuccess` – VPA resolved
  - `400`: `ValidationError` – Bad request

---

## 6 Request Body Schemas

### 6.1 `IntentRequest`

| Field                 | Type             | Required | Notes            |
|-----------------------|------------------|----------|------------------|
| merchantTransactionId | string           | ✅       | Unique Txn ID    |
| amount                | number (double)  | ✅       | In INR           |
| payerVpa              | string           | ✅       |                  |
| payeeVpa              | string           | ✅       |                  |
| currency              | string (enum)    | ✅       | Allowed: `INR`   |

---

### 6.2 `CollectRequest`

| Field                 | Type             | Required |
|-----------------------|------------------|----------|
| merchantTransactionId | string           | ✅       |
| invoiceId             | string           | ✅       |
| amount                | number (double)  | ✅       |
| payeeVpa              | string           | ✅       |

---

### 6.3 `ReversalRequest`

| Field   | Type   | Required |
|---------|--------|----------|
| txnId   | string | ✅       |
| reason  | string | ✅       |

---

### 6.4 `VpaRequest`

| Field   | Type   | Required |
|---------|--------|----------|
| vpa     | string | ✅       |

---

## 6.5 Response Descriptions

| HTTP Code | Name             | Description                             |
|-----------|------------------|-----------------------------------------|
| 200       | IntentSuccess     | Payment initiated                        |
| 201       | CollectSuccess    | Collect request accepted                 |
| 200       | StatusSuccess     | Transaction status returned              |
| 200       | ReversalSuccess   | Transaction reversal successful          |
| 200       | VpaSuccess        | VPA alias resolved                       |
| 400       | ValidationError   | Bad request or validation failed         |
| 401       | AuthError         | Authentication or authorization failed   |
| 404       | NotFound          | Transaction not found                    |
| 409       | DuplicateTxn      | Duplicate transaction detected           |

---

