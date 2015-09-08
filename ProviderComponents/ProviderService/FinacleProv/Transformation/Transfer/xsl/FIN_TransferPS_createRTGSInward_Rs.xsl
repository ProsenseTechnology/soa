<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
                xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
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
        <oracle-xsl-mapper:rootElement name="CreateRTGSInwardOutputCollection"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SUN MAY 10 10:58:07 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/app:CreateRTGSInwardOutputCollection/app:CreateRTGSInwardOutput">
          <eo:Transfer>
            <com:TransferIdentifier>
              <com:BankID>
                <xsl:value-of select="app:UnitId"/>
              </com:BankID>
            </com:TransferIdentifier>
            <com:TransactionReferenceNumber>
              <xsl:value-of select="app:UniqueTransactionRefNo"/>
            </com:TransactionReferenceNumber>
            <com:Amount>
              <xsl:value-of select="app:TranAmt"/>
            </com:Amount>
            <eo:sendRecvInfo1>
              <xsl:value-of select="app:SendRecvInfo1"/>
            </eo:sendRecvInfo1>
            <com:PayFromAccount>
              <com:AccountIdentifier>
                <com:BankID>
                  <xsl:value-of select="app:BankCode"/>
                </com:BankID>
                <com:AccountID>
                  <xsl:value-of select="app:DrAcct"/>
                </com:AccountID>
              </com:AccountIdentifier>
              <com:PartyReference>
                <com:Address>
                  <com:LineOne>
                    <xsl:value-of select="app:OrdInstAddr1"/>
                  </com:LineOne>
                </com:Address>
              </com:PartyReference>
            </com:PayFromAccount>
            <com:PayeeAccount>
              <com:AccountIdentifier>
                <com:AccountID>
                  <xsl:value-of select="app:BenCustAcctId"/>
                </com:AccountID>
              </com:AccountIdentifier>
              <com:PartyReference>
                <com:PersonName>
                  <com:FullName>
                    <xsl:value-of select="app:BenCustName"/>
                  </com:FullName>
                </com:PersonName>
                <com:Address>
                  <com:LineOne>
                    <xsl:value-of select="app:BenCustAddr1"/>
                  </com:LineOne>
                  <com:LineTwo>
                    <xsl:value-of select="app:BenCustAddr2"/>
                  </com:LineTwo>
                </com:Address>
              </com:PartyReference>
            </com:PayeeAccount>
            
          </eo:Transfer>
        </xsl:for-each>
        <xsl:if test="count (/app:CreateRTGSInwardOutputCollection/app:CreateRTGSInwardOutput ) > 0">
          <com:Status>
            <com:Code>ESB-00</com:Code>
            <com:Type>Success</com:Type>
            <com:Text>RTGS inward created successfully</com:Text>
          </com:Status>
        </xsl:if>
        <xsl:if test="count (/app:CreateRTGSInwardOutputCollection/app:CreateRTGSInwardOutput ) &lt;= 0">
          <com:Status>
            <com:Code>ESB-100</com:Code>
            <com:Type>Failue</com:Type>
            <com:Text>RTGS inward details not found</com:Text>
          </com:Status>
        </xsl:if>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>