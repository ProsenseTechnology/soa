<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Cheque/V1"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/db/FIN_DB_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="QueryChequeUpdateStatusOutputCollection"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Instruments/Cheque/V1/ChequeEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Cheque/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SUN MAY 10 10:49:38 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/app:QueryChequeUpdateStatusOutputCollection/app:QueryChequeUpdateStatusOutput">
          <eo:Cheque>
            <com:ChequeIdentifier>
              <com:BankID>
                <xsl:value-of select="app:BankId"/>
              </com:BankID>
              <com:AccountID>
                <xsl:value-of select="app:AccountNo"/>
              </com:AccountID>
              <com:ChequeID>
                <xsl:value-of select="app:InstNo"/>
              </com:ChequeID>
            </com:ChequeIdentifier>
            <com:TransactionReferenceNumber>
              <xsl:value-of select="app:TransactionRefNo"/>
            </com:TransactionReferenceNumber>
            <com:CoreTxnRefNo>
              <xsl:value-of select="app:CoreTxnRefNo"/>
            </com:CoreTxnRefNo>
            <eo:ChequeStatus>
              <xsl:value-of select="app:Status"/>
            </eo:ChequeStatus>
          </eo:Cheque>
        </xsl:for-each>
        <xsl:if test="count (/app:QueryChequeUpdateStatusOutputCollection/app:QueryChequeUpdateStatusOutput ) > 0">
          <com:Status>
            <com:Code>ESB-00</com:Code>
            <com:Type>Success</com:Type>
            <com:Text>Cheque update status queried successfully</com:Text>
          </com:Status>
        </xsl:if>
        <xsl:if test="count (/app:QueryChequeUpdateStatusOutputCollection/app:QueryChequeUpdateStatusOutput ) &lt;= 0">
          <com:Status>
            <com:Code>ESB-100</com:Code>
            <com:Type>Failue</com:Type>
            <com:Text>Cheque update status details not found</com:Text>
          </com:Status>
        </xsl:if>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
