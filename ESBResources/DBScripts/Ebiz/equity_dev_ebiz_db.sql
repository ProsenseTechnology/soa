SELECT PROJECT_NUMBER, EXPENDITURE_TYPE, TASK_NAME, DESCRIPTION, EXPENDITURE_ITEM_DATE, SUPPLIER, TRANSACTION_ID, INVOICE_NUM, ITEM_DESCRIPTION, TRANSACTION_AMOUNT, TRANS_CURR_CODE, ACCOUNTED_AMOUNT, PROJECT_CURRENCY_CODE, PROJECT_AMOUNT, PO_NUMBER
FROM PROJECT_INFO WHERE EXPENDITURE_ITEM_DATE BETWEEN '01-Dec-14' AND '05-Dec-14';


select * FROM PROJECT_INFO;

select * from PROJECTS_UPLOADS;

truncate table PROJECTS_UPLOADS;