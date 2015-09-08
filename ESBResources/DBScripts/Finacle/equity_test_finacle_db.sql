-- Customer Master
SELECT a.BANK_ID,
  a.orgkey cifno,
  a.name CustName,
  a.orgkey PrimaryID,
  'FINN' HostSystem,
  '' ContactPerson,
  MANAGER RMName,
  '' RMMailID,
  a.ADDRESS_LINE1 Address1,
  a.ADDRESS_LINE2 Address2,
  a.ADDRESS_LINE3 Address3,
  '' Address4,
  (SELECT REF_DESC
  FROM tbaadm.RCT
  WHERE REF_REC_TYPE='01'
  AND REF_CODE      =a.city
  AND rct.bank_id   ='54'
  ) CityTown,
  a.COUNTRY "Country Code",
  a.ZIP ZipCode,
  '' FaxNo,
  a.PREFERREDPHONE PhoneNo,
  a.PREFERREDPHONE CellNo,
  a.PREFERREDEMAIL EmailID,
  a.PRIMARY_SOL_ID BranchCode,
  '' PostingBranchCode,
  DECODE(gender,'F','I','M','I','C') CustCategory,
  '' CustTaxCode,
  '' CustTaxID,
  DECODE(a.SUSPENDED,'N','A','C') Status
FROM crmuser.accounts a,
  tbaadm.gam g
WHERE g.cif_id             = a.orgkey
AND a.bank_id              ='54'
AND g.bank_id              = '54'
AND TRUNC(g.acct_opn_date) = to_date('01-DEC-14','dd-mm-yyyy');
-- Account Master
SELECT BANK_ID,
  foracid AcountNo,
  acct_crncy_code AccountCcy,
  sol_id Branch,
  ACCT_NAME AccountName,
  TO_CHAR(acct_opn_date,'YYYYMMDD') OpenDate,
  cif_id CIFNo,
  DECODE(schm_type,'CAA','1','SBA','1','TDA','2','LAA','3','CASA')AccountType,
  schm_code ProductCd,
  DECODE(cif_id,NULL,'Bank','Customer')AccCategory,
  '' IBAN,
  DECODE(acct_cls_flg,'Y','C','O') ClosureFlag,
  TO_CHAR(acct_cls_date,'YYYYMMDD') ClosureDate,
  'N' NoCreditStatus,
  'N' NoDebitStatus,
  '' DelinquencyStatus,
  DECODE(
  (SELECT ACCT_STATUS FROM tbaadm.SMT WHERE bank_id='54' AND acid=a.acid
  ),'A','N',NULL,'N','Y') InactiveStatus
FROM tbaadm.gam a
WHERE del_flg       ='N'
AND BANK_ID         ='54'
AND CUST_ID        IS NOT NULL
AND TRUNC(LCHG_TIME)= to_date('01-DEC-14','dd-mm-yyyy');
-- Exchange Rate
SELECT BANK_ID,
  VAR_CRNCY_CODE BaseCcy,
  a.FXD_CRNCY_CODE CounterCcy,
  TO_CHAR(RTLIST_DATE,'YYYYMMDD') StartDate,
  1 Quotient,
  'D' ConversionMethod,
  SUM(DECODE(a.RATECODE,'CNB',CUST_VAR_CRNCY_UNITS)) BidRate,
  SUM(DECODE(a.RATECODE,'CNS',CUST_VAR_CRNCY_UNITS)) OfferRate,
  SUM(DECODE(a.RATECODE,'MEAN',CUST_VAR_CRNCY_UNITS)) MidRate,
  TO_CHAR(RTLIST_DATE,'YYYYMMDD') LAST_DATE
FROM tbaadm.rth a,
  (SELECT FXD_CRNCY_CODE,
    RATECODE,
    MAX(LCHG_TIME) maxtime
  FROM tbaadm.rth
  WHERE bank_id  ='54'
  AND ratecode  IN ('CNS','CNB','MEAN')
  AND rtlist_date=:vrate_date
  GROUP BY FXD_CRNCY_CODE,
    RATECODE
  ) b
WHERE bank_id       ='54'
AND a.ratecode     IN ('CNS','CNB','MEAN')
AND a.LCHG_TIME     =b.maxtime
AND a.FXD_CRNCY_CODE=b.FXD_CRNCY_CODE
AND a.RATECODE      =b.RATECODE
AND rtlist_date     =:vrate_date
GROUP BY VAR_CRNCY_CODE,
  a.FXD_CRNCY_CODE,
  RTLIST_DATE,
  BANK_ID;
-- Deposit Account Master
SELECT 'D',
  g.bank_id,
  g.cif_id,
  g.foracid DepositAccountNumber,
  t.TRAN_ID BilyetNumber,
  tam_crncy_code Currency,
  t.xfer_in_ind Status,
  t.cumulative_principal Current_Principal_Amount,
  t.deposit_amount DepositAmount,
  TO_CHAR(t.maturity_date,'YYYYMMDD') MaturityDate,
  e.interest_rate CurrentInterestRate,
  0 BonusInterestRate,
  e.nrml_booked_amount_cr InterestToDate,
  e.interest_rate InterestRate,
  'M' AS TenorUnit,
  t.deposit_period_mths TenorValue,
  'X' DepositType,
  TO_CHAR(t.open_effective_date,'YYYYMMDD') Posting_Date,
  DECODE(auto_renewal_flg, 'N' ,'No AutoRenewal','R','AutoRenewal') AS MaturityInstructions
FROM TBAADM.gam g,
  TBAADM.tam t,
  tbaadm.eit e
WHERE g.acid                                   = t.acid
AND e.entity_id                                = t.acid
AND g.schm_type                                = 'TDA'
AND g.acct_cls_flg                            != 'Y'
AND g.sol_id                                   = t.sol_id
AND DECODE(upper('ALL'), 'ALL','ALL',g.sol_id) = DECODE(upper('ALL'), 'ALL','ALL',upper('ALL'))
AND g.bank_id                                  = 54
AND e.bank_id                                  = 54
AND t.bank_id                                  = 54
AND g.acct_opn_date                           >= to_date('01-APR-15', 'dd-mm-yyyy')
AND g.acct_opn_date                           <= to_date('01-APR-15', 'dd-mm-yyyy');
-- Instrument Status Update
SELECT 'D',
  d.bank_id,
  'C' InstType,
  d.tran_id TransactionRefNo,
  d.INSTRMNT_NUM CoreTxnRefNo,
  ' ' SerialNo,
  g.foracid AccountNo,
  d.INSTRMNT_NUM InstNo,
  (SUBSTR(CHQ_LVS_STAT, ((to_number(trim(d.instrmnt_num)))-(to_number(trim(c.BEGIN_CHQ_NUM))))+1,1)) status
FROM tbaadm.htd d,
  tbaadm.hth h,
  tbaadm.gam g,
  tbaadm.cbt c
WHERE h.tran_id                      = d.tran_id
AND g.acid                           = d.acid
AND g.acid                           = c.acid
AND to_number(trim(d.instrmnt_num)) >= trim(c.BEGIN_CHQ_NUM)
AND to_number(trim(d.instrmnt_num)) <= trim(c.END_CHQ_NUM)
AND h.tran_date                      = d.tran_date
AND h.tran_date                     >= to_date('01-APR-15','dd-mm-yyyy')
AND h.tran_date                     <= to_date('01-APR-15','dd-mm-yyyy')
AND h.DELIVERY_CHANNEL_ID            = 'VER'
AND d.bank_id                        = '54'
AND h.bank_id                        = '54'
AND d.part_tran_type                 = 'D';
-- Loan Account Master
SELECT 'D',
  g.bank_id UnitId,
  g.schm_type AccType,
  g.schm_code AccSubType,
  g.sanct_lim TotalLoanAmount,
  ROUND(NRML_ACCRUED_AMOUNT_DR,2) InterestAccrued,
  l.lam_crncy_code SettlementCurrency,
  g.foracid LoanAccountNumber,
  l.lam_crncy_code LoanCurrency,
  g.acct_Name LoanAccountName,
  DECODE(l.loan_type,'N','Normal','T','Transfer-In') LoanType,
  b.foracid FundingAccount,
  r.lr_freq_type PaymentFrequency,
  l.dis_amt Original_Amount,
  g.clr_bal_amt OutStanding_Amount,
  SUM(t.DMD_AMT) - SUM(t.TOT_ADJ_AMT) PastDueAmount,
  d.flow_amt LastPaymentAmount,
  TO_CHAR(d.value_date,'YYYYMMDD') LastPaymentReceivedDate,
  r.num_of_flows TotalNumberofInstallments,
  f.fullypaid InstallmentsPaid,
  TO_CHAR(dis_shdl_date,'YYYYMMDD') LoanStartDate,
  TO_CHAR(l.ei_perd_end_date,'YYYYMMDD') LoanMaturityDate,
  ABS(e.interest_rate) InterestRate,
  TO_CHAR(r.next_dmd_date,'YYYYMMDD')NextPaymentDate,
  '' NextPaymentAmount,
  '0' PayoffAmount,
  '' PrincipelClosingBalance,
  b.foracid DisbursementAccount,
  b.foracid InterestRepaymentAccount,
  DECODE(g.acct_cls_flg,'Y','Closed','N','Open','Open') Loanstatus,
  l.rep_perd_mths Tenure,
  TO_CHAR(l.ei_perd_end_date,'YYYYMMDD') LoanClosureDate,
  g.sanct_lim ApprovedLimit,
  '' PenaltyInterestRate,
  '' PenaltiesDue,
  a.SUB_CLASSIFICATION_SYSTEM DelinquencyStatus,
  TO_CHAR(r.next_dmd_date,'YYYYMMDD') NextPrincipalDueDate,
  TO_CHAR(r.next_dmd_date,'YYYYMMDD') NextInterestDueDate,
  f.delayledpaid NoofDelayed_Payments,
  dis_amt DisbursedAmount
FROM tbaadm.gam g,
  tbaadm.gam b,
  tbaadm.lam l,
  tbaadm.eit e,
  tbaadm.ldt t,
  tbaadm.acd a,
  (SELECT acid,
    flow_amt,
    value_date,
    bank_id
  FROM tbaadm.ltd l
  WHERE value_date =
    (SELECT MAX(VALUE_DATE) FROM tbaadm.ltd WHERE acid = l.acid
    )
  AND flow_id = 'COLLC'
  ) d,
  (SELECT acid,
    COUNT(
    CASE
      WHEN count1 >= 0
      THEN 1
    END) fullypaid,
    COUNT(
    CASE
      WHEN count1 < 0
      THEN 1
    END) delayledpaid
  FROM
    (SELECT acid,
      dmd_date,
      SUM(tot_adj_amt) - SUM(dmd_amt) count1
    FROM tbaadm.ldt
    WHERE bank_id = '54'
      --and acid = 'ES9422680'
    GROUP BY acid ,
      dmd_date
    )
  GROUP BY acid
  ) f,
  (SELECT sol_id,
    acid,
    lr_freq_type,
    num_of_flows,
    next_dmd_date
  FROM tbaadm.lrs r
  WHERE r.SHDL_NUM =
    (SELECT MAX(b.SHDL_NUM) FROM TBAADM.lrs b WHERE r.acid = b.acid
    )
  AND FLOW_ID ='EIDEM'
  ) r
WHERE l.acid    = g.acid
AND d.acid      = g.acid
AND e.entity_id = g.acid
AND l.op_acid   = b.acid
AND t.acid      = g.acid
AND r.acid      = g.acid
AND f.acid      =g.acid
AND r.sol_id    = g.sol_id
AND a.B2K_TYPE  ='ACCNT'
AND g.acid      = a.B2K_ID
  --and g.foracid = '0630562489813'
AND g.acct_opn_date >= to_date(:start_date, 'dd-mm-yyyy')
AND g.acct_opn_date <= to_date(:end_date, 'dd-mm-yyyy')
AND g.schm_type      ='LAA'
  --and decode(upper(:sol_id), 'ALL','ALL',g.sol_id) = --decode(upper(:sol_id), 'ALL','ALL',upper(:sol_id))
AND g.bank_id = '54'
AND l.bank_id = '54'
AND e.bank_id = '54'
AND t.bank_id = '54'
AND d.bank_id = '54'
AND a.bank_id = '54'
GROUP BY g.bank_id,
  g.acid,
  g.schm_type,
  g.schm_code,
  dis_amt,
  NRML_ACCRUED_AMOUNT_DR,
  lam_crncy_code,
  g.foracid,
  g.acct_Name,
  g.clr_bal_amt,
  g.acct_cls_flg,
  l.loan_type,
  b.foracid,
  r.lr_freq_type,
  d.flow_amt,
  d.value_date,
  r.num_of_flows,
  f.fullypaid,
  f.delayledpaid,
  dis_shdl_date,
  l.ei_perd_end_date,
  e.interest_rate,
  r.next_dmd_date,
  l.rep_perd_mths,
  ei_perd_end_date,
  l.lam_crncy_code,
  g.sanct_lim,
  a.SUB_CLASSIFICATION_SYSTEM;