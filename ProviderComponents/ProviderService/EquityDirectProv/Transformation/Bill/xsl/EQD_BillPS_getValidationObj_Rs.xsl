<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://equitybank.co.ke/" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Bill/V1"
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
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/EquityDirect/AppMetadata/xsds/ValidationCallerService.xsd"/>
        <oracle-xsl-mapper:rootElement name="getValidationObjResponse" namespace="http://equitybank.co.ke/"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Bill/V1/BillEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Bill/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <eo:Bill>
          <com:BillIdentifier>
            <com:BillID>
              <xsl:value-of select="/app:getValidationObjResponse/return/billNumber"/>
            </com:BillID>
          </com:BillIdentifier>
          <com:Amount currencyCode="{/app:getValidationObjResponse/return/currency_code}">
            <xsl:value-of select="/app:getValidationObjResponse/return/amount"/>
          </com:Amount>
          <eo:BillName>
            <xsl:value-of select="/app:getValidationObjResponse/return/billName"/>
          </eo:BillName>
          <eo:BillStatus>
            <xsl:value-of select="/app:getValidationObjResponse/return/status"/>
          </eo:BillStatus>
          <eo:CreatedBy>
            <xsl:value-of select="substring(/app:getValidationObjResponse/return/created_on,1,10)"/>
          </eo:CreatedBy>
          <eo:CustomerName>
            <xsl:value-of select="/app:getValidationObjResponse/return/customerName"/>
          </eo:CustomerName>
          <eo:CustomerRefNumber>
            <xsl:value-of select="/app:getValidationObjResponse/return/customerRefNumber"/>
          </eo:CustomerRefNumber>
          <eo:DocumentrRefNumber>
            <xsl:value-of select="/app:getValidationObjResponse/return/doc_ref"/>
          </eo:DocumentrRefNumber>
        </eo:Bill>
        <com:Status>
          <xsl:choose>
            <xsl:when test="/app:getValidationObjResponse/return/status = 'true'">
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>Validation successfully</com:Text>
            </xsl:when>
            <xsl:otherwise>
              <com:Code>ESB-100</com:Code>
              <com:Type>Failure</com:Type>
              <com:Text>
                <xsl:value-of select="/app:getValidationObjResponse/return/message"/>
              </com:Text>
            </xsl:otherwise>
          </xsl:choose>
        </com:Status>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
