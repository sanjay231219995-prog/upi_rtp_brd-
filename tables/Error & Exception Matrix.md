| App Code           | HTTP | ISO 20022 Code | Scenario                       | Related REQ |
| ------------------ | ---- | -------------- | ------------------------------ | ----------- |
| TXN\_DUPLICATE     | 409  | DUPL           | Duplicate txnId within 24 h    | REQ-003     |
| LIMIT\_EXCEEDED    | 400  | AM09           | Amount > ₹ 200 000             | REQ-002     |
| INVALID\_SIGNATURE | 401  | SEC03          | Bad or missing API key         | REQ-010     |
| NOT\_FOUND         | 404  | RP04           | TxnId not found                | REQ-009     |
| VALIDATION\_ERROR  | 400  | RP02           | Missing/invalid request fields | REQ-024     |
