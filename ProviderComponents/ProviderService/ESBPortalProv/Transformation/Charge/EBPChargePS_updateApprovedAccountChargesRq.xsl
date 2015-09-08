<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl eo oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Charge/V1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Charge/V1/ChargeEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Charge/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../ESBMetadata/ComponentLibrary/ProviderServices/ESBPortal/AppMetadata/xsds/Charges.xsd"/>
        <oracle-xsl-mapper:rootElement name="accountChargesVO" namespace=""/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU AUG 13 15:14:07 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <xsl:param name="index"/>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <accountChargesVO>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/com:ChargeIdentifier/com:AccountID">
        <accountId>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/com:ChargeIdentifier/com:AccountID"/>
        </accountId>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/com:ChargeIdentifier/com:ChargeID">
        <chargeMasterId>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/com:ChargeIdentifier/com:ChargeID"/>
        </chargeMasterId>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/com:ChargeIdentifier/com:AccountCurrency">
        <chargeCurrency>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/com:ChargeIdentifier/com:AccountCurrency"/>
        </chargeCurrency>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:ChargeOption">
        <chargeOption>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:ChargeOption"/>
        </chargeOption>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:CreatedBy">
        <createdBy>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:CreatedBy"/>
        </createdBy>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:DiscountPercentage">
        <discountPercentage>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:DiscountPercentage"/>
        </discountPercentage>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:CreateDate">
        <createDate>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:CreateDate"/>
        </createDate>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:LastUpdated">
        <lastUpdated>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:LastUpdated"/>
        </lastUpdated>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:LastRunBy">
        <lastRunBy>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:LastRunBy"/>
        </lastRunBy>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:LastRunDate">
        <lastRunDate>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:LastRunDate"/>
        </lastRunDate>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:NextRunDate">
        <nextRunDate>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:NextRunDate"/>
        </nextRunDate>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:UpdatedBy">
        <updateBy>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:UpdatedBy"/>
        </updateBy>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:WaiveChargesIndicator">
        <waiveChargesIndicator>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:WaiveChargesIndicator"/>
        </waiveChargesIndicator>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:ReferenceNumber">
        <referenceNumber>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:ReferenceNumber"/>
        </referenceNumber>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:ChargeStatus">
        <chargeStatus>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:ChargeStatus"/>
        </chargeStatus>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/eo:ApprovedBy">
        <approvedBy>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/eo:ApprovedBy"/>
        </approvedBy>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/com:ChargeAmount">
        <chargeAmount>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/com:ChargeAmount"/>
        </chargeAmount>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/com:Remarks">
        <comments>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/com:Remarks"/>
        </comments>
      </xsl:if>
    </accountChargesVO>
  </xsl:template>
</xsl:stylesheet>