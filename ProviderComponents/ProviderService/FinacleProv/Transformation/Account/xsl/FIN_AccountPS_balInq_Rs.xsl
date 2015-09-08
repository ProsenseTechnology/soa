<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="ForEachFiXml" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [MON JUN 22 13:56:46 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/app:ForEachFiXml/app:FIXML">
          <eo:Account>
            <com:AccountIdentifier>
              <com:BankID>
                <xsl:value-of select="app:Header/app:ResponseHeader/app:ResponseMessageInfo/app:BankId"/>
              </com:BankID>
              <com:AccountID>
                <xsl:value-of select="app:Body/app:BalInqResponse/app:BalInqRs/app:AcctId/app:AcctId"/>
              </com:AccountID>
              <com:AccountCurrency>
                <xsl:value-of select="app:Body/app:BalInqResponse/app:BalInqRs/app:AcctId/app:AcctCurr"/>
              </com:AccountCurrency>
            </com:AccountIdentifier>
            <xsl:for-each select="app:Body/app:BalInqResponse/app:BalInqRs/app:AcctBal">
              <com:Balance>
                <com:BalanceAmount currencyCode="{app:BalAmt/app:currencyCode}">
                  <xsl:value-of select="app:BalAmt/app:amountValue"/>
                </com:BalanceAmount>
                <com:BalanceType>
                  <xsl:value-of select="app:BalType"/>
                </com:BalanceType>
              </com:Balance>
            </xsl:for-each>
          </eo:Account>
          <xsl:choose>
            <xsl:when test="app:Body/app:Error">
              <com:Status>
                <com:Code>ESB-100</com:Code>
                <com:Type>
                  <xsl:value-of select="app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
                </com:Type>
                <xsl:choose>
                  <xsl:when test="count (app:Body/app:Error/app:FIBusinessException ) > 0">
                    <com:Text>
                      <xsl:value-of select="concat ('ErrorCode ', app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorCode, ',  ErrorDesc ', app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorDesc )"/>
                    </com:Text>
                  </xsl:when>
                  <xsl:otherwise>
                    <com:Text>
                      <xsl:value-of select="concat ('ErrorCode ', app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorCode, ',  ErrorDesc ', app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorDesc )"/>
                    </com:Text>
                  </xsl:otherwise>
                </xsl:choose>
              </com:Status>
            </xsl:when>
            <xsl:otherwise>
              <com:Status>
                <com:Code>ESB-00</com:Code>
                <com:Type>
                  <xsl:value-of select="app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
                </com:Type>
                <com:Text>Success</com:Text>
              </com:Status>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>