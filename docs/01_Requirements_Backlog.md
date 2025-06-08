# UPI 2.0 Real-Time Payments – Requirements Backlog  

 
---

## 1 · Objective & Business Drivers  
Provide real-time push (credit) and pull (collect) payments over **UPI 2.0** that:

* clear end-to-end in < 2 seconds (95-th percentile);  
* support P2P, dynamic-QR P2M, signed mandates, overdraft, and **UPI Number** aliases;  
* map one-to-one to **ISO 20022 pacs.008/pacs.002** messages for future cross-border rails.

Key drivers:  
* NPCI raised the per-transaction cap to **₹2 lakh** and added overdraft + signed intent features.  
* RBI e-mandate framework now allows recurring debits up to **₹15 k** without extra factor auth.  
* New NPCI performance rules (Aug 2025) impose stricter latency and rate-limit SLAs.  
* Indian real-time cross-border corridors (e.g., UPI-PayNow) use pacs.008 as the common lingua-franca.

---

## 2 · Stakeholder Matrix  

| Stakeholder | Role in Ecosystem | Pain Point / Goal | Contact Freq. |
|-------------|------------------|-------------------|---------------|
| **Payer PSP** | Initiating bank / wallet | < 2 s latency, low fraud, rich receipts | Daily |
| **Payee PSP** | Receiving bank / acquirer | Guaranteed credit & fee visibility | Daily |
| **NPCI Switch** | Scheme operator | SLA adherence, settlement integrity | RT |
| **Sponsor Banks** | Hold settlement accounts | Net-settle positions + reconcile ISO files | Hourly |
| **Core Banking Teams** | CA/SB & overdraft ledgers | Atomic posting, ODS fallback | Weekly |
| **Fraud-Ops** | Risk & dispute desks | False-positive < 0.2 %, fast reversal | Ad-hoc |
| **RBI Compliance** | Regulator | AML/KYC logs, 7-year retention | Monthly |
| **Merchants** | Dynamic-QR issuers | Invoice data, instant confirmation | Daily |

---

## 3 · High-Level Requirements Table  

| REQ-ID      | Requirement Summary                                            | Use Case          | Spec Endpoint / FSD Ref                           | Test Case | Evidence File                             | Status    |
| ----------- | -------------------------------------------------------------- | ----------------- | ------------------------------------------------- | --------- | ----------------------------------------- | --------- |
| **REQ-001** | 95 % of transactions must complete in ≤ 2 000 ms (P95)         | UC-01 (P2P Push)  | `POST /pay/api/mobile/upi/intent/android`         | TC-01     | `samples/api/phonepe_success_push.json`   | Completed |
| **REQ-003** | Duplicate `txnId` within 24 h must return HTTP 409 + DUPLICATE | UC-01 (P2P Push)  | Same endpoint (`/intent`)                         | TC-03     | `samples/api/phonepe_duplicate.json`      | Completed |
| **REQ-002** | Collect flow shall support amount ≤ ₹ 200 000                  | UC-02 (Collect)   | `POST /pay/api/mobile/upi/collect`                | TC-05     | `samples/api/phonepe_limit_exceeded.json` | Completed |
| **REQ-010** | All APIs require a valid signature/API-key header              | Common (Auth)     | Security (OpenAPI §7)                             | TC-14     | `samples/api/phonepe_invalid_sig.json`    | Completed |
| **REQ-004** | Signed mandate registration captures amountRule & validTo      | UC-03 (Mandate)   | `POST /mandate/register` (FSD §4.1)               | TC-07     | *(to be added)*                           | Pending   |
| **REQ-008** | Overdraft fallback to OD when CA/SB balance is insufficient    | UC-04 (Overdraft) | Overdraft flow (FSD §8.1)                         | TC-11     | *(to be added)*                           | Pending   |
| **REQ-007** | UPI Number alias resolution P95 ≤ 50 ms                        | UC-05 (Alias)     | `POST /pay/api/mobile/upi/validateVpa` (FSD §3.5) | TC-13     | *(to be added)*                           | Pending   |
| **REQ-009** | Expose `/status` endpoint for reconciliation                   | Common (Status)   | `GET /pay/api/mobile/upi/status` (API §3.4)       | TC-24     | *(to be added)*                           | Pending   |
| **REQ-012** | Retain transaction & ACK/NAK logs for ≥ 7 years                | Common (Logging)  | Logging & Retention (FSD §7)                      | TC-15     | *(to be added)*                           | Pending   |
| **REQ-020** | Support burst load of 5 000 TPS                                | NFR (Performance) | Performance (BRD §5)                              | TC-17     | *(to be added)*                           | Pending   |


---

## 4 · Assumptions & Constraints  
* NPCI scheme fees remain constant through FY 25-26.  
* ISO 20022 mapping targets **CBPR+ November 2025** guidelines.  
* RBI daily settlement window continues at 23:30 IST.  
* No support for multi-currency legs in Phase 1.

---

## 5 · Glossary (excerpt)  
| Term | Meaning |
|------|---------|
| **UPI** | Unified Payments Interface |
| **PSP** | Payment Service Provider |
| **VPA** | Virtual Payment Address (`name@psp`) |
| **RTP** | Real-Time Payments |
| **pacs.008** | ISO 20022 Customer Credit Transfer message |
| **pacs.002** | ISO 20022 Payment Status Report |
| **camt.053** | ISO 20022 Bank to Customer Statement |
| **MoSCoW** | Must, Should, Could, Won’t prioritisation |

---

*Source references – NPCI UPI 2.0 feature set & ₹2 lakh cap; RBI e-mandate ₹15 k limit; Aug 2025 NPCI SLA and rate-limit circulars; ISO 20022 CBPR+ mapping guides.* :contentReference[oaicite:0]{index=0}

```bash
git add docs/01_Requirements_Backlog.md
git commit -m "Add initial requirements backlog for UPI RTP BRD"
```
