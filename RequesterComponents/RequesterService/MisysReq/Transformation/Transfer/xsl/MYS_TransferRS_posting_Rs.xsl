<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
                xmlns:rs="urn:control.services.tiplus2.misys.com"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:msg="urn:messages.service.ti.apps.tiplus2.misys.com"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Misys/AppMetadata/V1/Control.xsd"/>
        <oracle-xsl-mapper:rootElement name="ServiceResponse" namespace="urn:control.services.tiplus2.misys.com"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <rs:ServiceResponse>
      <rs:ResponseHeader>
        <rs:Service>TransferES</rs:Service>
        <rs:Operation>Posting</rs:Operation>
        <xsl:choose>
          <xsl:when test='/eo:ESBMsg/eo:RsData/com:Status/com:Type = "SUCCESS"'>
            <rs:Status>SUCCEEDED</rs:Status>
          </xsl:when>
          <xsl:when test='/eo:ESBMsg/eo:RsData/com:Status/com:Type = "FAILURE"'>
            <rs:Status>FAILED</rs:Status>
          </xsl:when>
          <xsl:otherwise>
            <rs:Status>UNAVAILABLE</rs:Status>
          </xsl:otherwise>
        </xsl:choose>
        <rs:Details>
          <xsl:choose>
            <xsl:when test='/eo:ESBMsg/eo:RsData/com:Status/com:Type = "SUCCESS"'>
              <rs:Error>ESB-00</rs:Error>
            </xsl:when>
            <xsl:when test='/eo:ESBMsg/eo:RsData/com:Status/com:Type = "FAILURE"'>
              <rs:Error>ESB-100</rs:Error>
            </xsl:when>
          </xsl:choose>
          <rs:Info>
            <xsl:value-of select="/eo:ESBMsg/eo:RsData/com:Status/com:Text"/>
          </rs:Info>
        </rs:Details>
        <rs:CorrelationId>1402</rs:CorrelationId>
      </rs:ResponseHeader>
      <msg:BatchResponse>
        <msg:Transfer>
          <msg:TransferIdentifier>
            <msg:BankID>
              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Transfer/com:TransferIdentifier/com:BankID"/>
            </msg:BankID>
            <msg:TransactionReferenceNumber>
              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Transfer/com:TransactionReferenceNumber"/>
            </msg:TransactionReferenceNumber>
            <msg:TransferId>
              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Transfer/com:TransferIdentifier/com:TransferID"/>
            </msg:TransferId>
            <msg:TransferStatus>
              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Transfer/eo:TransferStatus"/>
            </msg:TransferStatus>
          </msg:TransferIdentifier>
        </msg:Transfer>
      </msg:BatchResponse>
    </rs:ServiceResponse>
  </xsl:template>
</xsl:stylesheet>