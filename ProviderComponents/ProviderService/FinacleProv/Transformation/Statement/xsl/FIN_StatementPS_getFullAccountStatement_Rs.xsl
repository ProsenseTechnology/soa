<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Statement/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="FIXML" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Statement/V1/StatementEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Statement/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:param name="toDate"/>
  <xsl:template match="/">
    <eo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:RequestMessageKey/app:RequestUUID"/>
      </com:MsgID>
      <eo:RsData>
        <eo:Statement>
          <com:AccountIdentifier>
            <com:BankID>
              <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:ResponseMessageInfo/app:BankId"/>
            </com:BankID>
            <com:BranchID>
              <xsl:value-of select="/app:FIXML/app:Body/app:getFullAccountStatementResponse/app:AccountStatement/app:accountBalances/app:branchId"/>
            </com:BranchID>
            <com:AccountID>
              <xsl:value-of select="/app:FIXML/app:Body/app:getFullAccountStatementResponse/app:AccountStatement/app:accountBalances/app:acid"/>
            </com:AccountID>
            <com:AccountCurrency>
              <xsl:value-of select="/app:FIXML/app:Body/app:getFullAccountStatementResponse/app:AccountStatement/app:accountBalances/app:currencyCode"/>
            </com:AccountCurrency>
          </com:AccountIdentifier>
          <com:Balance>
            <com:BalanceAmount currencyCode="{/app:FIXML/app:Body/app:getFullAccountStatementResponse/app:AccountStatement/app:accountBalances/app:availableBalance/app:currencyCode}">
              <xsl:value-of select="/app:FIXML/app:Body/app:getFullAccountStatementResponse/app:AccountStatement/app:accountBalances/app:availableBalance/app:amountValue"/>
            </com:BalanceAmount>
          </com:Balance>
          <xsl:for-each select="/app:FIXML/app:Body/app:getFullAccountStatementResponse/app:AccountStatement/app:transactionDetails">
            <xsl:variable name="postDate" select="number(translate(substring(app:pstdDate,1,10),'-',''))"/>
            <xsl:variable name="filterDate" select="number(translate($toDate,'-',''))"/>
            <xsl:choose>
              <xsl:when test="$postDate &lt;= $filterDate">
                <com:Transaction>
                  <com:TransactionID>
                    <xsl:value-of select="app:txnId"/>
                  </com:TransactionID>
                  <com:TransactionType>
                    <xsl:value-of select="app:transactionSummary/app:txnType"/>
                  </com:TransactionType>
                  <com:TransactionCategory>
                    <xsl:value-of select="app:txnCat"/>
                  </com:TransactionCategory>
                  <com:TransactionSerialNumber>
                    <xsl:value-of select="app:txnSrlNo"/>
                  </com:TransactionSerialNumber>
                  <com:TransactionDescription>
                    <xsl:value-of select="app:transactionSummary/app:txnDesc"/>
                  </com:TransactionDescription>
                  <com:InstrumentReferenceNumber>
                    <xsl:value-of select="app:transactionSummary/app:instrumentId"/>
                  </com:InstrumentReferenceNumber>
                  <com:TransactionAmount>
                    <xsl:value-of select="app:transactionSummary/app:txnAmt/app:amountValue"/>
                  </com:TransactionAmount>
                  <com:TransactionDateTime>
                    <xsl:value-of select="app:transactionSummary/app:txnDate"/>
                  </com:TransactionDateTime>
                  <com:ValueDate>
                    <xsl:value-of select="app:valueDate"/>
                  </com:ValueDate>
                  <com:TransactionBalance currencyCode="{app:txnBalance/app:currencyCode}">
                    <xsl:value-of select="app:txnBalance/app:amountValue"/>
                  </com:TransactionBalance>
                </com:Transaction>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </eo:Statement>
        <xsl:choose>
          <xsl:when test="count (/app:FIXML/app:Body/app:Error ) &lt;= 0">
            <com:Status>
              <com:Code>ESB-00</com:Code>
              <com:Type>
                <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
              </com:Type>
              <com:Text>Full account statement queried successfully</com:Text>
            </com:Status>
          </xsl:when>
          <xsl:otherwise>
            <com:Status>
              <com:Code>ESB-100</com:Code>
              <com:Type>
                <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
              </com:Type>
              <xsl:choose>
                <xsl:when test="count (/app:FIXML/app:Body/app:Error/app:FIBusinessException ) > 0">
                  <com:Text>
                    <xsl:value-of select="concat ('ErrorCode ', /app:FIXML/app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorCode, ',  ErrorDesc ', /app:FIXML/app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorDesc )"/>
                  </com:Text>
                </xsl:when>
                <xsl:otherwise>
                  <com:Text>
                    <xsl:value-of select="concat ('ErrorCode ', /app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorCode, ',  ErrorDesc ', /app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorDesc )"/>
                  </com:Text>
                </xsl:otherwise>
              </xsl:choose>
            </com:Status>
          </xsl:otherwise>
        </xsl:choose>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>