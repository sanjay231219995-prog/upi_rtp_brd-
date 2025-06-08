## Field-Level ISO 20022 Mapping

| JSON Field            | JSON Path                 | ISO 20022 Element                 | Notes                                 |
| --------------------- | ------------------------- | --------------------------------- | ------------------------------------- |
| merchantTransactionId | `$.merchantTransactionId` | `<GrpHdr><MsgId>`                 | Unique 35-char identifier             |
| amount                | `$.amount`                | `<IntrBkSttlmAmt Ccy="INR">`      | Two decimal places                    |
| payerVpa              | `$.payerVpa`              | `<Dbtr><Id><PrvtId><Othr><Id>`    | `<Issr>UPI</Issr>`                    |
| payeeVpa              | `$.payeeVpa`              | `<Cdtr><Id><PrvtId><Othr><Id>`    | —                                     |
| invoiceId             | `$.invoiceId`             | `<RmtInf><Strd><CdtrRefInf><Ref>` | Invoice reference in QR payload       |
| txnId                 | `$.txnId`                 | `<PmtId><InstrId>`                | Must match `MsgId` for reconciliation |
| reason                | `$.reason`                | `<SplmtryData>`                   | Free-form reversal reason             |
