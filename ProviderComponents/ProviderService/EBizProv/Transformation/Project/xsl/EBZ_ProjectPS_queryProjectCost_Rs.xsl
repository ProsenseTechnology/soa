<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/EBiz/Adapter/db"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <xsl:import href="../../../../ESBMetadata/XSL/DateTime_Functions.xsl"/>
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/db/EBZ_DB_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="ProjectInfoCollection"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/EBiz/Adapter/db"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/Project/V1/ProjectEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <com:MsgID>1234</com:MsgID>
      <com:Source>DPV</com:Source>
      <com:MsgType>Enterprise</com:MsgType>
      <com:Service>ProjectES</com:Service>
      <eo:RsData>
        <xsl:for-each select="/app:ProjectInfoCollection/app:ProjectInfo">
          <eo:Project>
            <com:ProjectIdentifier>
              <com:ProjectID>
                <xsl:value-of select="app:projectId"/>
              </com:ProjectID>              
                  <com:ProjectNumber>
                    <xsl:value-of select="app:projectNumber"/>
                  </com:ProjectNumber>
            </com:ProjectIdentifier>
            <eo:ExpenditureType>
              <xsl:value-of select="app:expenditureType"/>
            </eo:ExpenditureType>
            <eo:ExpenditureDescription>
              <xsl:value-of select="app:itemDescription"/>
            </eo:ExpenditureDescription>
            <eo:TaskName>
              <xsl:value-of select="app:taskName"/>
            </eo:TaskName>
            <eo:TaskDescription>
              <xsl:value-of select="app:description"/>
            </eo:TaskDescription>
            <eo:ExpenditureDate>
              <xsl:call-template name="formatDate_From_DD-Mon-YY_To_YYYY-MM-DD">
                <xsl:with-param name="Date" select="app:expenditureItemDate"/>
              </xsl:call-template>
            </eo:ExpenditureDate>
            <eo:SupplierName>
              <xsl:value-of select="app:supplier"/>
            </eo:SupplierName>
            <eo:TransactionID>
              <xsl:value-of select="app:transactionId"/>
            </eo:TransactionID>
            <eo:TransactionAmount currencyCode="{app:transCurrCode}">
              <xsl:value-of select="app:transactionAmount"/>
            </eo:TransactionAmount>
            <eo:AccountedAmount>
              <xsl:value-of select="app:accountedAmount"/>
            </eo:AccountedAmount>
            <eo:ProjectAmount currencyCode="{app:projectCurrencyCode}">
              <xsl:value-of select="app:projectAmount"/>
            </eo:ProjectAmount>
            <eo:InvoiceNumber>
              <xsl:value-of select="app:invoiceNum"/>
            </eo:InvoiceNumber>
            <eo:PONumber>
              <xsl:value-of select="app:poNumber"/>
            </eo:PONumber>
          </eo:Project>
        </xsl:for-each>
        <com:Status>
          <xsl:choose>
            <xsl:when test="count(/app:ProjectInfoCollection/app:ProjectInfo) > '0'">
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>Processed successfully</com:Text>
            </xsl:when>
            <xsl:otherwise>
              <com:Code>ESB-100</com:Code>
              <com:Type>Failure</com:Type>
              <com:Text>No records found</com:Text>
            </xsl:otherwise>
          </xsl:choose>
        </com:Status>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>